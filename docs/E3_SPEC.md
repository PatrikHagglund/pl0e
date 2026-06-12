# e3 Language Specification

## Overview

e3 extends e2 with:
- **Booleans** (`true`, `false`, `&&`, `||`, `!`)
- **Callables** (closures via `\params -> expr`, Haskell-style)
- **Case expressions** (in addition to case statements)
- **Function application** via juxtaposition

Unlike the (deliberately minimal) e1 spec, this spec classifies behavior
precisely — e3 is the level where multiple types make the distinctions
interesting.

## Behavior Categories

| Category | Meaning |
|----------|---------|
| **Defined** | Identical across implementations. The differential-testable core. |
| **Implementation-defined** | Each implementation chooses a consistent behavior (and should document it). |
| **Erroneous** | The program is incorrect, but the consequence is bounded: a specified *fallback value*, or a diagnostic — per the handling mode (see below). |
| **Undefined** | No requirements: reject, terminate, or substitute any behavior. |
| **Runtime error** | The implementation must diagnose the condition and halt the program. |

Unmarked behavior is defined. e6 is expected to turn most of e3's runtime
errors into static (compile-time) errors.

### Erroneous Behavior and Handling Modes

Each erroneous construct has a specified fallback value. How a violation
is handled is an implementation *option*, selectable per violation kind
(in the Koka interpreters: `--enforce`, `--erroneous=MODE`,
`--erroneous:KIND=MODE`):

| Mode | Checked? | On violation |
|------|----------|--------------|
| `enforce` | yes | diagnose and halt |
| `observe` | yes | diagnose, continue with the fallback value |
| `fallback` (default) | yes | continue with the fallback value, silently |
| `unchecked` | no | undefined — the performance escape hatch (a compiler may omit guards) |

In every mode except `unchecked`, an implementation must not *assume*
that erroneous operations are unreachable (no optimization on that basis).

This design follows the C++26 contracts discussion: `enforce`/`observe`
correspond to P2900's evaluation semantics, `fallback` to C++26
"erroneous behavior" (P2795: a defined-but-incorrect result that
implementations may diagnose), and `unchecked` to P2900's `ignore` — with
the difference that C++ contracts never supply fallback values (ignored
contracts fall through to the annotated code's own semantics), whereas
here the language itself must say what the operation yields. The
no-assumption rule is C++'s hard-won lesson: coupling "checked assertion"
with "optimizer may assume" turns violations into undefined behavior.

Violation kinds at e3: `div0`, `unbound`, `nomatch` (e4 adds `oob`).

## Syntax

### Grammar (PEG)

```peg
program         = _ statement*
statement       = binding / case_stmt / loop_stmt / break_stmt / print_stmt / block / expression

block           = "{" _ (statement ";"? _)* "}" _
loop_stmt       = "loop" _ statement
break_stmt      = "break" _
print_stmt      = "print" _ expression
case_stmt       = "case" _ "{" _ stmt_arm+ "}" _
stmt_arm        = or_expr "->" _ statement

binding         = ident _ ":=" _ expression
                / ident _ ":"

expression      = func_lit / case_expr / or_expr
case_expr       = "case" _ "{" _ expr_arm+ "}" _
expr_arm        = or_expr "->" _ or_expr ","? _

or_expr         = and_expr ("||" _ and_expr)*
and_expr        = not_expr ("&&" _ not_expr)*
not_expr        = "!" _ cmp_expr / cmp_expr

cmp_expr        = sum_expr (relop sum_expr)?
relop           = ("==" / "!=" / "<=" / ">=" / "<" / ">") _

sum_expr        = product (("+" / "-") _ product)*
product         = unary (("*" / "/" / "%") _ unary)*
unary           = "-" _ apply_expr / apply_expr

apply_expr      = atom (__ atom)*
atom            = int_lit / bool_lit / "(" _ expression ")" _ / ident / block

int_lit         = digit+ _
bool_lit        = ("true" / "false") !idchar _
func_lit        = "\" _ params? "->" _ expression
params          = ident _ ("," _ ident _)* ","? _

keyword         = ("case" / "loop" / "break" / "true" / "false" / "print") !idchar
ident           = !keyword letter idchar* _
idchar          = [a-zA-Z0-9_]
letter          = [a-zA-Z]
digit           = [0-9]

_               = ([ \t\n\r] / comment)*
__              = [ \t]+
comment         = "//" [^\n]* / "/*" (!"*/" .)* "*/"
```

Grammar notes:
- Comparisons are non-associative (`a < b < c` is invalid; parenthesize).
- `!` binds *looser* than comparisons: `!a == b` parses as `!(a == b)`,
  and a negated comparison operand must be parenthesized — `a == !b` is
  invalid, write `a == (!b)`. (Found by differential fuzzing.)

## Types

| Type | Values | Operations |
|------|--------|------------|
| ℤ (integers) | ..., -1, 0, 1, ... | `+` `-` `*` `/` `%` |
| 𝔹 (booleans) | `true`, `false` | `&&` `\|\|` `!` |
| () → T (callables) | closures | application via juxtaposition |

Type bridge: relational operators `==` `!=` `<` `>` `<=` `>=` map ℤ × ℤ → 𝔹.
Additionally, `==` `!=` map 𝔹 × 𝔹 → 𝔹. Note this deviates from e2, where
comparisons yield the *integers* 1/0 (see "Superset deviations" in
[DESIGN.md](DESIGN.md)).

e3 is dynamically typed: a variable may hold a value of any type, and
operand types are checked at runtime (see Type Errors below). The integer
range is implementation-defined, as in e1.

## Semantics

### Callables

**Definition**: `\x -> expr` or `\x, y -> expr` creates a closure capturing the current environment.

**Application**: `f x` applies function `f` to argument `x`. Multi-argument: `f x y` is `(f x) y` (left-associative).

**Currying**: `\x, y -> x + y` applied to one argument returns a closure awaiting the second.

### Case Expressions

```e3
result := case {
  x < 0  -> -1,
  x == 0 -> 0,
  true   -> 1
}
```

Evaluates arms top-to-bottom; returns value of first arm whose condition is truthy.

### Boolean Operations

- `&&` and `||` are short-circuiting: the right operand is evaluated only
  if the left does not decide the result
- `!` negates a boolean

### Case Guards (truthiness)

Guards of case statements and case expressions are tried in order; the
first *satisfied* arm is taken. A guard is satisfied when it evaluates to
`true` or to a **nonzero integer**; `false` and `0` are not satisfied.
This is the only place integers act as booleans — it keeps e2's
default-arm idiom `1 -> ...` working. A guard evaluating to a closure is
undefined.

If no guard of a *case statement* is satisfied, the statement is a no-op.
If no guard of a *case expression* is satisfied, that is **erroneous**
(kind `nomatch`, fallback value 0): an expression must produce a value.

### Arithmetic

As in e2: division and modulo are Euclidean (the remainder is
non-negative: `-7 / 2` is `-4`, `-7 % 2` is `1`). Division or modulo by
zero is **erroneous** (kind `div0`, fallback value 0).

### Type Errors

The following are **runtime errors** (diagnosed, the program halts):

- Arithmetic (`+` `-` `*` `/` `%`, unary `-`) unless both operands are integers
- Ordering comparison (`<` `<=` `>` `>=`) unless both operands are integers
- `==` `!=` unless both operands are integers or both are booleans
- `&&` `||` `!` unless the (evaluated) operands are booleans
- Applying a value that is not a closure

The single exception is case guards, which accept integers (see above).

### Other Behavior

- Referencing an undeclared variable is **erroneous** (kind `unbound`,
  fallback value 0). (At e1, deliberately minimal, this is undefined.)
- `break` outside any loop is undefined (as in e1).
- `print` writes integers in decimal and booleans as `true`/`false`,
  followed by a newline; the textual form of a closure is
  implementation-defined.
- Declarations (`x:`) create a variable with an implementation-defined
  initial value.
- Syntactically invalid programs are rejected. Memory exhaustion may
  terminate any program.

## Examples

### Higher-Order Function

```e3
twice := \f -> \x -> f (f x)
inc := \n -> n + 1
print twice inc 5  // 7
```

### Factorial

```e3
result := 1
n := arg1
loop {
  case { n == 0 -> break }
  result := result * n
  n := n - 1
}
print result
```

### Y Combinator (Recursion without Self-Reference)

```e3
Y := \f -> (\x -> f (\y -> x x y)) (\x -> f (\y -> x x y))
fact := Y (\self -> \n -> case { n == 0 -> 1, true -> n * self (n - 1) })
print fact 5  // 120
```

## Known Limitations

- No recursive closures (closure cannot reference itself by name)
- Use Y combinator for recursion (see example above)
