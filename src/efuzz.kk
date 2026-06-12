// efuzz: random e1/e2/e3 program generator with co-evaluation (docs/FUZZING.md)
//
// Generates well-defined programs (termination by construction) together
// with their expected output, for differential testing across implementations.
//
// Usage: efuzz [seed] [size] [level]      (level: 1, 2 or 3, default 1)
//
// Output: the program, a "// violations:" marker (first erroneous construct
// the program triggers, or "none"), the program text, and its expected
// output as trailing "// expect:" comments — so the output is itself a
// valid program that any implementation can run directly.
//
// Well-definedness invariants:
// - Loops are counter-down: counter set to a literal bound, decremented each
//   iteration, exit on the counter reaching zero; bodies never assign the
//   counter. Level-2+ loops may add a data-dependent early-break arm —
//   termination is still guaranteed by the counter.
// - Programs are well-typed by construction (level 3 has int/bool/closure
//   types and runtime type errors; a type error would halt the program).
// - Closure values never flow as arguments (arguments are integer
//   expressions), so self-application — the only route to divergence
//   without loops — is impossible; closure calls always terminate.
// - Variables are only read after being assigned; vars first assigned inside
//   a loop/if/case body are not read after the body (it may not execute).
// - Binary +/- expressions are fully parenthesized: their associativity is
//   implementation-defined in e1, so chains would be an unfair oracle.
// - Erroneous constructs (E3_SPEC.md) may be generated — div0 at level 2+,
//   nomatch (case expressions) at level 3 — and are co-evaluated with their
//   fallback values; the first kind triggered is recorded in the
//   "// violations:" marker for the driver's bidirectional enforce oracle.
// - At level 2, comparisons appear only in guard position: they yield 1/0
//   at e2 but true/false at e3 (semantic superset deviation, DESIGN.md).
//   At level 3 they are ordinary boolean expressions.
// - Programs whose values exceed 10^60 in magnitude are regenerated with a
//   different internal seed (multiplication inside loops can explode); the
//   cap is checked between statements and loop iterations during
//   co-evaluation, since repeated squaring would otherwise hang the
//   generator before a final check is reached.

module efuzz

import std/os/env

// === AST ===
// Structured loop/if/case instead of raw loop/break: termination is a
// construction invariant, not a property to verify afterwards.

type fexpr
  FLit(n: int)
  FVar(name: string)
  FNeg(e: fexpr)
  FAdd(l: fexpr, r: fexpr)
  FSub(l: fexpr, r: fexpr)
  FMul(l: fexpr, r: fexpr)              // level 2+
  FDiv(l: fexpr, r: fexpr)              // level 2+
  FMod(l: fexpr, r: fexpr)              // level 2+
  FCmp(op: string, l: fexpr, r: fexpr)  // level 2+: int x int; level 3 ==/!= also bool x bool
  FBool(b: bool)                        // level 3+
  FAnd(l: fexpr, r: fexpr)              // level 3+, short-circuit
  FOr(l: fexpr, r: fexpr)               // level 3+, short-circuit
  FNot(e: fexpr)                        // level 3+
  FCaseE(arms: list<(fexpr, fexpr)>)    // level 3 guard-style case expression
  FLam(ps: list<string>, body: fexpr)   // level 3+, int params -> int body
  FApp(f: string, args: list<fexpr>)    // level 3+, full application of a named closure
  FArr(elems: list<fexpr>)              // level 4: int-element array literal
  FIdxDot(arr: string, i: int)          // level 4: arr.i (literal index, may be oob)
  FIdxDyn(arr: string, idx: fexpr)      // level 4: arr (idx) (dynamic index, may be oob)
  FCasePE(scrut: string, arms: list<(fpat, fexpr)>)  // level 4 pattern-case expression

// Patterns (level 4)
type fpat
  PWildP
  PVarP(name: string)
  PLitP(n: int)
  PArrP(elems: list<fpat>, rest: bool)  // exact (a; b;) or prefix (a; b; _)

type fstmt
  FDecl(name: string)
  FAssign(name: string, e: fexpr)
  FPrint(e: fexpr)
  // Counter-down loop; early is an optional early-break guard (level 2+;
  // bool-typed at level 4, where it is emitted as a scrutinee case).
  FLoop(counter: string, bound: int, early: maybe<fexpr>, body: list<fstmt>)
  FIf(cond: string, body: list<fstmt>)
  // Guard-style case statement: first arm with a satisfied guard wins (levels 2-3).
  FCase(arms: list<(fexpr, list<fstmt>)>)
  // Pattern-case statement on an array variable (level 4). Pattern-variable
  // bindings persist after the taken arm, mirroring e4peg.
  FCaseP(scrut: string, arms: list<(fpat, list<fstmt>)>)

// === Deterministic RNG (64-bit LCG, Knuth constants) ===

struct genst
  seed: int
  nextid: int
  ivars: list<string>          // int variables (readable and assignable)
  bvars: list<string>          // bool variables (level 3+)
  fvars: list<(string, int)>   // closure variables: (name, arity) (level 3+)
  avars: list<string>          // array variables (level 4)
  ros: list<string>            // read-only int vars (loop counters: assigning
                               // one could break guaranteed termination)

fun rng-next(st: genst): (genst, int)
  val s2 = (st.seed * 6364136223846793005 + 1442695040888963407) % 18446744073709551616
  (Genst(s2, st.nextid, st.ivars, st.bvars, st.fvars, st.avars, st.ros), (s2 / 8589934592) % 2147483648)

fun pick(st: genst, n: int): (genst, int)
  val (st2, r) = rng-next(st)
  (st2, r % n)

fun fresh(st: genst, pre: string): (genst, string)
  (Genst(st.seed, st.nextid + 1, st.ivars, st.bvars, st.fvars, st.avars, st.ros), pre ++ st.nextid.show)

fun add-ivar(st: genst, name: string): genst
  Genst(st.seed, st.nextid, Cons(name, st.ivars), st.bvars, st.fvars, st.avars, st.ros)

fun add-bvar(st: genst, name: string): genst
  Genst(st.seed, st.nextid, st.ivars, Cons(name, st.bvars), st.fvars, st.avars, st.ros)

fun add-fvar(st: genst, name: string, arity: int): genst
  Genst(st.seed, st.nextid, st.ivars, st.bvars, Cons((name, arity), st.fvars), st.avars, st.ros)

fun add-avar(st: genst, name: string): genst
  Genst(st.seed, st.nextid, st.ivars, st.bvars, st.fvars, Cons(name, st.avars), st.ros)

fun add-ro(st: genst, name: string): genst
  Genst(st.seed, st.nextid, st.ivars, st.bvars, st.fvars, st.avars, Cons(name, st.ros))

fun with-ivars(st: genst, ivs: list<string>): genst
  Genst(st.seed, st.nextid, ivs, st.bvars, st.fvars, st.avars, st.ros)

fun restore-vars(st: genst, saved: genst): genst
  Genst(st.seed, st.nextid, saved.ivars, saved.bvars, saved.fvars, saved.avars, saved.ros)

fun pick-from(st: genst, vs: list<string>): (genst, maybe<string>)
  match vs
    Nil -> (st, Nothing)
    _ ->
      val (st2, i) = pick(st, vs.length)
      (st2, vs.drop(i).head)

// Readable int variable (for int expressions)
fun pick-ivar(st: genst): (genst, maybe<string>)
  pick-from(st, st.ivars ++ st.ros)

// Assignable int variable (for assignment targets)
fun pick-itarget(st: genst): (genst, maybe<string>)
  pick-from(st, st.ivars)

fun pick-bvar(st: genst): (genst, maybe<string>)
  pick-from(st, st.bvars)

fun pick-fvar(st: genst): (genst, maybe<(string, int)>)
  match st.fvars
    Nil -> (st, Nothing)
    fs ->
      val (st2, i) = pick(st, fs.length)
      (st2, fs.drop(i).head)

fun pick-avar(st: genst): (genst, maybe<string>)
  pick-from(st, st.avars)

val cmp-ops = ["==", "!=", "<", "<=", ">", ">="]

// === Generator ===

// Integer-typed expression
fun gen-iexpr(st: genst, depth: int, lvl: int): div (genst, fexpr)
  val (st2, r) = pick(st, 100)
  if depth <= 0 || r < 25 then
    if r % 2 == 0 && !st2.ivars.is-nil then
      val (st3, mv) = pick-ivar(st2)
      match mv
        Just(v) -> (st3, FVar(v))
        Nothing -> gen-lit(st3)
    else gen-lit(st2)
  elif r < 40 && !st2.ivars.is-nil then
    val (st3, mv) = pick-ivar(st2)
    match mv
      Just(v) -> (st3, FVar(v))
      Nothing -> gen-lit(st3)
  elif lvl >= 3 && r < 46 && !st2.fvars.is-nil then
    gen-app(st2, depth, lvl)
  elif lvl >= 4 && r < 52 && !st2.avars.is-nil then
    gen-index(st2, depth, lvl)
  elif r < 52 then
    val (st3, e) = gen-iexpr(st2, depth - 1, lvl)
    (st3, FNeg(e))
  elif r < 70 then
    val (st3, l) = gen-iexpr(st2, depth - 1, lvl)
    val (st4, rr) = gen-iexpr(st3, depth - 1, lvl)
    (st4, FAdd(l, rr))
  elif lvl < 2 || r < 78 then
    val (st3, l) = gen-iexpr(st2, depth - 1, lvl)
    val (st4, rr) = gen-iexpr(st3, depth - 1, lvl)
    (st4, FSub(l, rr))
  elif r < 88 then
    val (st3, l) = gen-iexpr(st2, depth - 1, lvl)
    val (st4, rr) = gen-iexpr(st3, depth - 1, lvl)
    (st4, FMul(l, rr))
  elif r < 94 then
    val (st3, l) = gen-iexpr(st2, depth - 1, lvl)
    val (st4, rr) = gen-iexpr(st3, depth - 1, lvl)
    (st4, FDiv(l, rr))
  else
    val (st3, l) = gen-iexpr(st2, depth - 1, lvl)
    val (st4, rr) = gen-iexpr(st3, depth - 1, lvl)
    (st4, FMod(l, rr))

// Application of a known closure to exactly arity int arguments (level 3+)
fun gen-app(st: genst, depth: int, lvl: int): div (genst, fexpr)
  val (st2, mf) = pick-fvar(st)
  match mf
    Just((f, arity)) ->
      val (st3, args) = gen-args(st2, depth, lvl, arity)
      (st3, FApp(f, args))
    Nothing -> gen-lit(st2)

// Array indexing (level 4). Indexes range over 0..4 regardless of length:
// out-of-bounds is erroneous (oob, fallback 0) and deliberately generated.
fun gen-index(st: genst, depth: int, lvl: int): div (genst, fexpr)
  val (st2, ma) = pick-avar(st)
  match ma
    Just(a) ->
      val (st3, q) = pick(st2, 100)
      if q < 60 then
        val (st4, i) = pick(st3, 5)
        (st4, FIdxDot(a, i))
      else
        val (st4, idx) = gen-iexpr(st3, 1, lvl)
        (st4, FIdxDyn(a, FMod(idx, FLit(5))))  // keep dynamic indexes small-ish
    Nothing -> gen-lit(st2)

fun gen-args(st: genst, depth: int, lvl: int, n: int): div (genst, list<fexpr>)
  if n <= 0 then (st, [])
  else
    val (st2, a) = gen-iexpr(st, if depth > 1 then 1 else 0, lvl)
    val (st3, rest) = gen-args(st2, depth, lvl, n - 1)
    (st3, Cons(a, rest))

// Boolean-typed expression (level 3+)
fun gen-bexpr(st: genst, depth: int, lvl: int): div (genst, fexpr)
  val (st2, r) = pick(st, 100)
  if depth <= 0 || r < 15 then
    val (st3, b) = pick(st2, 2)
    (st3, FBool(b == 1))
  elif r < 35 && !st2.bvars.is-nil then
    val (st3, mv) = pick-bvar(st2)
    match mv
      Just(v) -> (st3, FVar(v))
      Nothing -> (st3, FBool(True))
  elif r < 65 then
    val (st3, i) = pick(st2, 6)
    val (st4, l) = gen-iexpr(st3, depth - 1, lvl)
    val (st5, rr) = gen-iexpr(st4, depth - 1, lvl)
    (st5, FCmp(cmp-ops.drop(i).head.default("=="), l, rr))
  elif r < 75 then
    val (st3, e) = gen-bexpr(st2, depth - 1, lvl)
    (st3, FNot(e))
  elif r < 85 then
    val (st3, l) = gen-bexpr(st2, depth - 1, lvl)
    val (st4, rr) = gen-bexpr(st3, depth - 1, lvl)
    (st4, FAnd(l, rr))
  elif r < 95 then
    val (st3, l) = gen-bexpr(st2, depth - 1, lvl)
    val (st4, rr) = gen-bexpr(st3, depth - 1, lvl)
    (st4, FOr(l, rr))
  else  // bool equality
    val (st3, i) = pick(st2, 2)
    val (st4, l) = gen-bexpr(st3, depth - 1, lvl)
    val (st5, rr) = gen-bexpr(st4, depth - 1, lvl)
    (st5, FCmp(if i == 0 then "==" else "!=", l, rr))

// Guard-position expression (case arm / early-break / if condition).
// At level 2, comparisons are generated only here (cmp-as-int diverges
// between e2 and e3, see DESIGN.md). Closure variables are never guards
// (a closure guard is undefined, E3_SPEC.md).
fun gen-guard(st: genst, lvl: int): div (genst, fexpr)
  val (st2, r) = pick(st, 100)
  if r < 50 then
    val (st3, i) = pick(st2, 6)
    val (st4, l) = gen-iexpr(st3, 2, lvl)
    val (st5, rr) = gen-iexpr(st4, 2, lvl)
    (st5, FCmp(cmp-ops.drop(i).head.default("=="), l, rr))
  elif lvl >= 3 && r < 65 && !st2.bvars.is-nil then
    val (st3, mv) = pick-bvar(st2)
    (st3, FVar(mv.default("acc")))
  elif r < 80 && !st2.ivars.is-nil then
    val (st3, mv) = pick-ivar(st2)
    match mv
      Just(v) -> (st3, FVar(v))
      Nothing -> (st3, FLit(1))
  elif lvl >= 3 && r < 88 then
    val (st3, b) = pick(st2, 2)
    (st3, FBool(b == 1))
  else
    val (st3, n) = pick(st2, 3)
    (st3, FLit(n))  // 0..2: sometimes a never-taken arm

fun gen-lit(st: genst): (genst, fexpr)
  val (st2, n) = pick(st, 100)
  (st2, FLit(n))

// Guard-style case expression (level 3): may have no satisfied arm, which
// is erroneous (nomatch) — deliberately generatable for the enforce oracle.
fun gen-case-expr(st: genst, lvl: int): div (genst, fexpr)
  val (st2, n) = pick(st, 2)
  val (st3, arms) = gen-expr-arms(st2, lvl, n + 2)
  (st3, FCaseE(arms))

fun gen-expr-arms(st: genst, lvl: int, n: int): div (genst, list<(fexpr, fexpr)>)
  if n <= 0 then (st, [])
  else
    val (st2, g) =
      if n == 1 then  // last arm: often (not always) a catch-all
        val (sta, q) = pick(st, 100)
        if q < 60 then (sta, FBool(True)) else gen-guard(sta, lvl)
      else gen-guard(st, lvl)
    val (st3, body) = gen-iexpr(st2, 2, lvl)
    val (st4, rest) = gen-expr-arms(st3, lvl, n - 1)
    (st4, Cons((g, body), rest))

// Integer assignment, optionally followed by accumulator mixing so every
// value affects the final printed result (fuzzgen's self-checking
// accumulator). At level 3 the RHS is sometimes a case expression.
fun gen-assign(st: genst, lvl: int): div (genst, list<fstmt>)
  val (st2, r) = pick(st, 100)
  val (st3, name) =
    if r < 60 || st2.ivars.is-nil then
      val (sta, n) = fresh(st2, "v")
      (sta, n)
    else
      val (sta, mv) = pick-itarget(st2)
      (sta, mv.default("v0"))
  val (st4, q) = pick(st3, 100)
  val (st5, e) =
    if lvl == 3 && q < 18 then gen-case-expr(st4, lvl)  // guard-style: not e4 syntax
    elif lvl >= 4 && q < 18 && !st4.avars.is-nil then gen-casepe(st4, lvl)
    else gen-iexpr(st4, 3, lvl)
  val st6 = if st5.ivars.find(fn(v) v == name).is-just then st5 else st5.add-ivar(name)
  val (st7, mix) = pick(st6, 100)
  if mix < 50 then
    (st7, [FAssign(name, e), FAssign("acc", FAdd(FVar("acc"), FVar(name)))])
  else
    (st7, [FAssign(name, e)])

// Pattern-case expression (level 4): may have no matching arm, which is
// erroneous (nomatch) — deliberately generatable for the enforce oracle.
// Pattern-variable bindings are visible in the arm's value expression.
fun gen-casepe(st: genst, lvl: int): div (genst, fexpr)
  val (st2, ma) = pick-avar(st)
  match ma
    Just(a) ->
      val (st3, n) = pick(st2, 2)
      val (st4, arms) = gen-pe-arms(st3, lvl, n + 2)
      (st4, FCasePE(a, arms))
    Nothing -> gen-lit(st2)

fun gen-pe-arms(st: genst, lvl: int, n: int): div (genst, list<(fpat, fexpr)>)
  if n <= 0 then (st, [])
  else
    val (st2, p) =
      if n == 1 then  // last arm: often (not always) a catch-all wildcard
        val (sta, q) = pick(st, 100)
        if q < 60 then (sta, PWildP) else gen-pat(sta)
      else gen-pat(st)
    val saved = st2
    val st3 = add-pat-vars(st2, p)
    val (st4, body) = gen-iexpr(st3, 2, lvl)
    val st5 = st4.restore-vars(saved)
    val (st6, rest) = gen-pe-arms(st5, lvl, n - 1)
    (st6, Cons((p, body), rest))

// A pattern over arrays: exact (a; b;), prefix (a; _), int literal, or var.
fun gen-pat(st: genst): div (genst, fpat)
  val (st2, r) = pick(st, 100)
  if r < 70 then
    val (st3, k) = pick(st2, 3)
    val (st4, elems) = gen-pat-elems(st3, k + 1)
    val (st5, q) = pick(st4, 100)
    if q < 40 then (st5, PArrP(elems, True))
    else
      // e4peg reads ANY trailing wildcard element as the prefix marker
      // ("(_;)" matches every array); an exact pattern must therefore not
      // end in _ — replace a trailing wildcard with a fresh var binder.
      match elems.reverse
        Cons(PWildP, rrest) ->
          val (st6, name) = fresh(st5, "m")
          (st6, PArrP(Cons(PVarP(name), rrest).reverse, False))
        _ -> (st5, PArrP(elems, False))
  elif r < 85 then
    val (st3, n) = pick(st2, 5)
    (st3, PLitP(n))  // int literal: an array scrutinee never matches it
  else
    val (st3, name) = fresh(st2, "m")
    (st3, PVarP(name))  // binds the whole scrutinee (an array)

fun gen-pat-elems(st: genst, n: int): div (genst, list<fpat>)
  if n <= 0 then (st, [])
  else
    val (st2, r) = pick(st, 100)
    val (st3, p) =
      if r < 50 then
        val (sta, name) = fresh(st2, "m")
        (sta, PVarP(name))
      elif r < 75 then (st2, PWildP)
      else
        val (sta, k) = pick(st2, 100)
        (sta, PLitP(k))
    val (st4, rest) = gen-pat-elems(st3, n - 1)
    (st4, Cons(p, rest))

// Pattern variables bound by p become readable ints in the arm body
// (element binders); a whole-scrutinee binder becomes an array variable.
fun add-pat-vars(st: genst, p: fpat): genst
  match p
    PVarP(name) -> st.add-avar(name)  // top-level: binds the array
    PArrP(elems, _) -> add-elem-vars(st, elems)
    _ -> st

fun add-elem-vars(st: genst, elems: list<fpat>): genst
  match elems
    Nil -> st
    Cons(PVarP(name), rest) -> add-elem-vars(st.add-ivar(name), rest)
    Cons(_, rest) -> add-elem-vars(st, rest)

// Closure definition: 1-2 int params, int body over params and captured
// variables (including previously defined closures — no cycles possible).
fun gen-lambda(st: genst, lvl: int): div (genst, list<fstmt>)
  val (st2, name) = fresh(st, "f")
  val (st3, na) = pick(st2, 2)
  val arity = na + 1
  val (st4, ps) = gen-params(st3, arity)
  val saved-ivars = st4.ivars
  val (st5, body) = gen-iexpr(st4.with-ivars(ps ++ saved-ivars), 3, lvl)
  (st5.with-ivars(saved-ivars).add-fvar(name, arity), [FAssign(name, FLam(ps, body))])

fun gen-params(st: genst, n: int): div (genst, list<string>)
  if n <= 0 then (st, [])
  else
    val (st2, p) = fresh(st, "p")
    val (st3, rest) = gen-params(st2, n - 1)
    (st3, Cons(p, rest))

fun gen-stmt(st: genst, depth: int, lvl: int): div (genst, list<fstmt>)
  val (st2, r) = pick(st, 100)
  if r < 28 then gen-assign(st2, lvl)
  elif r < 42 then
    val (st3, q) = pick(st2, 100)
    if lvl >= 3 && q < 30 then
      val (st4, e) = gen-bexpr(st3, 2, lvl)
      (st4, [FPrint(e)])
    else
      val (st4, e) = gen-iexpr(st3, 2, lvl)
      (st4, [FPrint(e)])
  elif r < 48 then
    val (st3, name) = fresh(st2, "d")
    (st3, [FDecl(name)])  // declared but never read: initial value is implementation-defined
  elif lvl >= 3 && r < 56 then
    val (st3, q) = pick(st2, 100)
    val (st4, name) =
      if q < 70 || st3.bvars.is-nil then
        val (sta, n) = fresh(st3, "b")
        (sta, n)
      else
        val (sta, mv) = pick-bvar(st3)
        (sta, mv.default("b0"))
    val (st5, e) = gen-bexpr(st4, 2, lvl)
    val st6 = if st5.bvars.find(fn(v) v == name).is-just then st5 else st5.add-bvar(name)
    (st6, [FAssign(name, e)])
  elif lvl >= 3 && r < 60 then gen-lambda(st2, lvl)
  elif lvl >= 4 && r < 66 then
    val (st3, name) = fresh(st2, "a")
    val (st4, k) = pick(st3, 4)
    val (st5, elems) = gen-args(st4, 2, lvl, k + 1)
    (st5.add-avar(name), [FAssign(name, FArr(elems))])
  elif r < 80 && depth < 2 then
    val saved = st2
    val (st3, counter) = fresh(st2, "c")
    val (st4, b) = pick(st3, 6)
    val st5 = st4.add-ro(counter)
    val (st6, early) =
      if lvl >= 2 then
        val (sta, q) = pick(st5, 100)
        if q < 30 then
          // Level 4 emits the early break as `case (g) { true -> break ... }`,
          // so the guard must be bool-typed there; levels 2-3 use truthy guards.
          val (stb, g) = if lvl >= 4 then gen-bexpr(sta, 2, lvl) else gen-guard(sta, lvl)
          (stb, Just(g))
        else (sta, Nothing)
      else (st5, Nothing)
    val (st7, body) = gen-stmts(st6, depth + 1, lvl, 0)
    (st7.restore-vars(saved), [FLoop(counter, b + 1, early, body)])
  elif depth < 2 && !st2.ivars.is-nil then
    val (st3, q) = pick(st2, 100)
    if lvl >= 4 && q < 50 && !st3.avars.is-nil then gen-casep(st3, depth, lvl)
    elif lvl >= 2 && lvl <= 3 && q < 50 then gen-case(st3, depth, lvl)
    else
      val saved = st3
      val (st4, mv) = pick-from(st3, st3.ivars ++ st3.bvars ++ st3.ros)
      val (st5, body) = gen-stmts(st4, depth + 1, lvl)
      (st5.restore-vars(saved), [FIf(mv.default("acc"), body)])
  else gen-assign(st2, lvl)

// Pattern-case statement on an array variable (level 4)
fun gen-casep(st: genst, depth: int, lvl: int): div (genst, list<fstmt>)
  val (st2, ma) = pick-avar(st)
  match ma
    Just(a) ->
      val (st3, n) = pick(st2, 2)
      val (st4, arms) = gen-p-arms(st3, depth, lvl, n + 2)
      (st4, [FCaseP(a, arms)])
    Nothing -> gen-assign(st2, lvl)

fun gen-p-arms(st: genst, depth: int, lvl: int, n: int): div (genst, list<(fpat, list<fstmt>)>)
  if n <= 0 then (st, [])
  else
    val (st2, p) =
      if n == 1 then  // last arm: usually a catch-all wildcard
        val (sta, q) = pick(st, 100)
        if q < 70 then (sta, PWildP) else gen-pat(sta)
      else gen-pat(st)
    val saved = st2
    val st3 = add-pat-vars(st2, p)
    val (st4, nb) = pick(st3, 2)
    val (st5, body) = gen-stmts-n(st4, depth + 1, lvl, nb + 1)
    val st6 = st5.restore-vars(saved)
    val (st7, rest) = gen-p-arms(st6, depth, lvl, n - 1)
    (st7, Cons((p, body), rest))

fun gen-case(st: genst, depth: int, lvl: int): div (genst, list<fstmt>)
  val (st2, n) = pick(st, 2)
  val (st3, arms) = gen-arms(st2, depth, lvl, n + 2)
  (st3, [FCase(arms)])

fun gen-arms(st: genst, depth: int, lvl: int, n: int): div (genst, list<(fexpr, list<fstmt>)>)
  if n <= 0 then (st, [])
  else
    val (st2, g) =
      if n == 1 then  // last arm: usually a catch-all default
        val (sta, q) = pick(st, 100)
        if q < 70 then (sta, FLit(1)) else gen-guard(sta, lvl)
      else gen-guard(st, lvl)
    val saved = st2
    val (st3, nb) = pick(st2, 2)
    val (st4, body) = gen-stmts-n(st3, depth + 1, lvl, nb + 1)
    val st5 = st4.restore-vars(saved)
    val (st6, rest) = gen-arms(st5, depth, lvl, n - 1)
    (st6, Cons((g, body), rest))

// Generate 1-3 statements (count == 0 picks randomly).
fun gen-stmts(st: genst, depth: int, lvl: int, count: int = 0): div (genst, list<fstmt>)
  val (st2, n) = if count > 0 then (st, count) else
    val (sta, r) = pick(st, 3)
    (sta, r + 1)
  gen-stmts-n(st2, depth, lvl, n)

fun gen-stmts-n(st: genst, depth: int, lvl: int, n: int): div (genst, list<fstmt>)
  if n <= 0 then (st, [])
  else
    val (st2, ss1) = gen-stmt(st, depth, lvl)
    val (st3, ss2) = gen-stmts-n(st2, depth, lvl, n - 1)
    (st3, ss1 ++ ss2)

fun gen-program(seed: int, size: int, lvl: int): div list<fstmt>
  val st0 = Genst(seed * 2 + 1, 0, [], [], [], [], []).add-ivar("acc")
  val (_, stmts) = gen-stmts-n(st0, 0, lvl, size)
  Cons(FAssign("acc", FLit(0)), stmts) ++ [FPrint(FVar("acc"))]

// === Reference evaluator (the ground-truth oracle) ===

type rv
  RInt(n: int)
  RBool(b: bool)
  RClos(ps: list<string>, body: fexpr, cenv: list<(string, rv)>)
  RArr(elems: list<rv>)

alias fenv = list<(string, rv)>

// Records the FIRST erroneous construct the program triggers (E3_SPEC.md):
// div0 (level 2+) or nomatch (level 3). Emitted as a "// violations:"
// marker so the diff drivers can assert both directions of the
// enforce-mode oracle: a clean program must not trip --enforce, and a
// marked program must halt with "Violation (<kind>)".
effect viol-flag
  fun mark-viol(knd: string): ()

fun fget(e: fenv, key: string): rv
  match e.filter(fn(p) p.fst == key)
    Cons((_, v), _) -> v
    Nil -> RInt(0)  // unreachable: variables are read only after assignment

fun fset(e: fenv, key: string, v: rv): fenv
  Cons((key, v), e.filter(fn(p) p.fst != key))

// Programs are well-typed by construction; a mismatch here is an efuzz bug.
fun as-int(v: rv): exn int
  match v
    RInt(n) -> n
    _ -> throw("efuzz internal error: int expected")

fun as-bool(v: rv): exn bool
  match v
    RBool(b) -> b
    _ -> throw("efuzz internal error: bool expected")

// Guard satisfaction: true or nonzero int (E3_SPEC.md case guards)
fun truthy(v: rv): bool
  match v
    RBool(b) -> b
    RInt(n) -> n != 0
    _ -> False

fun feval(e: fenv, ex: fexpr): <div,exn,viol-flag> rv
  match ex
    FLit(n) -> RInt(n)
    FBool(b) -> RBool(b)
    FVar(x) -> fget(e, x)
    FNeg(x) -> RInt(0 - feval(e, x).as-int)
    FAdd(l, r) -> RInt(feval(e, l).as-int + feval(e, r).as-int)
    FSub(l, r) -> RInt(feval(e, l).as-int - feval(e, r).as-int)
    FMul(l, r) -> RInt(feval(e, l).as-int * feval(e, r).as-int)
    FDiv(l, r) ->
      // Left-to-right, like the interpreters: the violation-order marker
      // must agree with which violation --enforce reports first.
      val lv = feval(e, l).as-int
      val rval = feval(e, r).as-int
      if rval == 0 then
        mark-viol("div0")
        RInt(0)
      else RInt(lv / rval)
    FMod(l, r) ->
      val lv = feval(e, l).as-int
      val rval = feval(e, r).as-int
      if rval == 0 then
        mark-viol("div0")
        RInt(0)
      else RInt(lv % rval)
    FCmp(op, l, r) ->
      val lv = feval(e, l)
      val rv2 = feval(e, r)
      match (lv, rv2)
        (RBool(a), RBool(b)) -> RBool(if op == "==" then a == b else a != b)
        (a, b) ->
          val x = a.as-int
          val y = b.as-int
          val t = match op
            "==" -> x == y
            "!=" -> x != y
            "<" -> x < y
            "<=" -> x <= y
            ">" -> x > y
            _ -> x >= y
          RBool(t)
    FAnd(l, r) ->  // short-circuit, as e3peg
      if feval(e, l).as-bool then RBool(feval(e, r).as-bool) else RBool(False)
    FOr(l, r) ->
      if feval(e, l).as-bool then RBool(True) else RBool(feval(e, r).as-bool)
    FNot(x) -> RBool(!feval(e, x).as-bool)
    FCaseE(arms) -> feval-case(e, arms)
    FArr(elems) -> RArr(elems.map(fn(el) feval(e, el)))
    FIdxDot(a, i) -> index-arr(e, a, i)
    FIdxDyn(a, idx) ->
      val i = feval(e, idx).as-int
      index-arr(e, a, i)
    FCasePE(scrut, arms) -> feval-casep(fget(e, scrut), arms, e)
    FLam(ps, body) -> RClos(ps, body, e)  // captures environment at creation
    FApp(f, args) ->
      match fget(e, f)
        RClos(ps, body, cenv) ->
          val env2 = bind-args(e, cenv, ps, args)
          feval(env2, body)
        _ -> throw("efuzz internal error: closure expected")

fun bind-args(caller: fenv, cenv: fenv, ps: list<string>, args: list<fexpr>): <div,exn,viol-flag> fenv
  match (ps, args)
    (Cons(p, prest), Cons(a, arest)) ->
      val av = feval(caller, a)
      bind-args(caller, fset(cenv, p, av), prest, arest)
    _ -> cenv

fun feval-case(e: fenv, arms: list<(fexpr, fexpr)>): <div,exn,viol-flag> rv
  match arms
    Nil ->
      mark-viol("nomatch")
      RInt(0)
    Cons((g, body), rest) ->
      if truthy(feval(e, g)) then feval(e, body)
      else feval-case(e, rest)

fun index-arr(e: fenv, a: string, i: int): <div,exn,viol-flag> rv
  match fget(e, a)
    RArr(elems) ->
      if i >= 0 && i < elems.length then elems.drop(i).head.default(RInt(0))
      else
        mark-viol("oob")
        RInt(0)
    _ -> throw("efuzz internal error: array expected")

// Mirrors e4peg match-pattern: exact length or prefix; returns bindings.
fun match-pat(p: fpat, v: rv): div maybe<list<(string, rv)>>
  match (p, v)
    (PWildP, _) -> Just([])
    (PVarP(name), _) -> Just([(name, v)])
    (PLitP(n), RInt(m)) -> if n == m then Just([]) else Nothing
    (PLitP(_), _) -> Nothing
    (PArrP(elems, rest), RArr(vs)) ->
      val len = vs.length
      val plen = elems.length
      if (if rest then len < plen else len != plen) then Nothing
      else match-pat-elems(elems, vs)
    _ -> Nothing

fun match-pat-elems(ps: list<fpat>, vs: list<rv>): div maybe<list<(string, rv)>>
  match (ps, vs)
    (Nil, _) -> Just([])
    (Cons(p, prest), Cons(v, vrest)) ->
      match match-pat(p, v)
        Nothing -> Nothing
        Just(binds) -> match match-pat-elems(prest, vrest)
          Nothing -> Nothing
          Just(more) -> Just(binds ++ more)
    _ -> Nothing

fun bind-all(e: fenv, binds: list<(string, rv)>): fenv
  match binds
    Nil -> e
    Cons((k, v), rest) -> bind-all(fset(e, k, v), rest)

fun feval-casep(scrut: rv, arms: list<(fpat, fexpr)>, e: fenv): <div,exn,viol-flag> rv
  match arms
    Nil ->
      mark-viol("nomatch")
      RInt(0)
    Cons((p, body), rest) ->
      match match-pat(p, scrut)
        Just(binds) -> feval(bind-all(e, binds), body)
        Nothing -> feval-casep(scrut, rest, e)

// Explicit recursion instead of foldl here and in bind-all: passing these
// effect-polymorphic functions as values sends the Koka 3.2.2 specializer
// into a core-dumping loop at -O1+ ("specInnerCalls: argument does not match").
fun mag(m: int, v: rv): div int
  match v
    RInt(n) ->
      val an = if n < 0 then 0 - n else n
      if an > m then an else m
    RArr(elems) -> mag-list(m, elems)
    _ -> m

fun mag-list(m: int, vs: list<rv>): div int
  match vs
    Nil -> m
    Cons(v, rest) -> mag-list(mag(m, v), rest)

// Magnitude cap (10^60). Checked between statements and loop iterations
// during co-evaluation, not just afterwards: repeated squaring (x := x * x
// in a loop or a long statement sequence) otherwise produces million-digit
// bigints and hangs the generator before the final check is ever reached
// (found via seed 1114). A program exceeding the cap is abandoned
// mid-evaluation and regenerated; its (now wrong) co-evaluation result is
// discarded with it.
val mag-cap: int = 1000000000000000000000000000000000000000000000000000000000000

fun show-rv(v: rv): div string
  match v
    RInt(n) -> n.show
    RBool(b) -> if b then "true" else "false"
    RClos(_, _, _) -> "<closure>"
    RArr(elems) ->  // e4peg format: "(1; 2;)", empty "()"
      if elems.is-nil then "()"
      else "(" ++ elems.map(show-rv).join("; ") ++ ";)"

// Returns (env, output lines in reverse order, max |int value| seen)
fun fexec(e: fenv, s: fstmt, out: list<string>, m: int): <div,exn,viol-flag> (fenv, list<string>, int)
  match s
    FDecl(_) -> (e, out, m)
    FAssign(x, ex) ->
      val v = feval(e, ex)
      (fset(e, x, v), out, mag(m, v))
    FPrint(ex) ->
      val v = feval(e, ex)
      (e, Cons(show-rv(v), out), mag(m, v))
    FLoop(c, b, early, body) -> fexec-loop(fset(e, c, RInt(b)), c, early, body, out, m)
    FIf(cond, body) ->
      if truthy(fget(e, cond)) then fexec-all(e, body, out, m)
      else (e, out, m)
    FCase(arms) -> fexec-case(e, arms, out, m)
    FCaseP(scrut, arms) -> fexec-casep(fget(e, scrut), arms, e, out, m)

fun fexec-casep(scrut: rv, arms: list<(fpat, list<fstmt>)>, e: fenv, out: list<string>, m: int): <div,exn,viol-flag> (fenv, list<string>, int)
  match arms
    Nil -> (e, out, m)  // pattern-case statement no-match is a defined no-op
    Cons((p, body), rest) ->
      match match-pat(p, scrut)
        // Bindings persist after the arm, mirroring e4peg's env-extend
        Just(binds) -> fexec-all(bind-all(e, binds), body, out, m)
        Nothing -> fexec-casep(scrut, rest, e, out, m)

fun fexec-loop(e: fenv, c: string, early: maybe<fexpr>, body: list<fstmt>, out: list<string>, m: int): <div,exn,viol-flag> (fenv, list<string>, int)
  if fget(e, c).as-int == 0 || m > mag-cap then (e, out, m)
  else
    val stop = match early
      Just(g) -> truthy(feval(e, g))
      Nothing -> False
    if stop then (e, out, m)
    else
      val (e2, out2, m2) = fexec-all(e, body, out, m)
      fexec-loop(fset(e2, c, RInt(fget(e2, c).as-int - 1)), c, early, body, out2, m2)

fun fexec-case(e: fenv, arms: list<(fexpr, list<fstmt>)>, out: list<string>, m: int): <div,exn,viol-flag> (fenv, list<string>, int)
  match arms
    Nil -> (e, out, m)  // case statement no-match is a defined no-op
    Cons((g, body), rest) ->
      if truthy(feval(e, g)) then fexec-all(e, body, out, m)
      else fexec-case(e, rest, out, m)

fun fexec-all(e: fenv, ss: list<fstmt>, out: list<string>, m: int): <div,exn,viol-flag> (fenv, list<string>, int)
  match ss
    Nil -> (e, out, m)
    Cons(s, rest) ->
      val (e2, out2, m2) = fexec(e, s, out, m)
      if m2 > mag-cap then (e2, out2, m2)  // abandon: program will be regenerated
      else fexec-all(e2, rest, out2, m2)

// Returns (output lines, max |int value|, first violation kind or "")
fun run-program(prog: list<fstmt>): <div,exn> (list<string>, int, string)
  var first := ""
  with fun mark-viol(knd)
    if first == "" then first := knd
  val (_, out, m) = fexec-all([], prog, [], 0)
  (out.reverse, m, first)

// === Pretty-printer ===

// Wrap in parens unless already an atom or self-parenthesizing.
fun show-atom(ex: fexpr): div string
  match ex
    FLit(_) -> show-fexpr(ex)
    FVar(_) -> show-fexpr(ex)
    FBool(_) -> show-fexpr(ex)
    _ -> "(" ++ show-fexpr-raw(ex) ++ ")"

// Without the outer parens that show-fexpr adds for binary forms
fun show-fexpr-raw(ex: fexpr): div string
  match ex
    FAdd(l, r) -> show-fexpr(l) ++ " + " ++ show-fexpr(r)
    FSub(l, r) -> show-fexpr(l) ++ " - " ++ show-fexpr(r)
    FMul(l, r) -> show-fexpr(l) ++ " * " ++ show-fexpr(r)
    FDiv(l, r) -> show-fexpr(l) ++ " / " ++ show-fexpr(r)
    FMod(l, r) -> show-fexpr(l) ++ " % " ++ show-fexpr(r)
    // Comparison operands are sum_expr in the grammar: a bare "!x" is not
    // grammatical there ("true != !false" fails to parse) and must be
    // parenthesized.
    FCmp(op, l, r) -> show-cmp-opnd(l) ++ " " ++ op ++ " " ++ show-cmp-opnd(r)
    FAnd(l, r) -> show-fexpr(l) ++ " && " ++ show-fexpr(r)
    FOr(l, r) -> show-fexpr(l) ++ " || " ++ show-fexpr(r)
    FApp(f, args) -> f ++ " " ++ args.map(fn(a) "(" ++ show-fexpr(a) ++ ")").join(" ")
    FIdxDyn(a, idx) -> a ++ " (" ++ show-fexpr(idx) ++ ")"
    _ -> show-fexpr(ex)

fun show-cmp-opnd(ex: fexpr): div string
  match ex
    FNot(_) -> "(" ++ show-fexpr(ex) ++ ")"
    _ -> show-fexpr(ex)

fun show-fexpr(ex: fexpr): div string
  match ex
    FLit(n) -> n.show
    FVar(x) -> x
    FBool(b) -> if b then "true" else "false"
    FNeg(e) -> "-" ++ show-atom(e)
    FNot(e) -> "!" ++ show-atom(e)
    FLam(ps, body) -> "\\" ++ ps.join(", ") ++ " -> " ++ show-fexpr(body)
    FCaseE(arms) ->
      "case { " ++ arms.map(fn((g, b)) show-fexpr(g) ++ " -> " ++ show-fexpr(b)).join(", ") ++ " }"
    FArr(elems) -> "(" ++ elems.map(show-fexpr).join("; ") ++ ";)"
    FIdxDot(a, i) -> a ++ "." ++ i.show
    FCasePE(scrut, arms) ->
      "case " ++ scrut ++ " { " ++
        arms.map(fn((p, b)) show-fpat(p) ++ " -> " ++ show-fexpr(b)).join(", ") ++ " }"
    _ -> "(" ++ show-fexpr-raw(ex) ++ ")"

fun show-fpat(p: fpat): div string
  match p
    PWildP -> "_"
    PVarP(name) -> name
    PLitP(n) -> n.show
    PArrP(elems, rest) ->
      if rest then "(" ++ elems.map(show-fpat).join("; ") ++ "; _)"
      else "(" ++ elems.map(show-fpat).join("; ") ++ ";)"

fun show-fstmt(s: fstmt, ind: string, lvl: int): div list<string>
  match s
    FDecl(x) -> [ind ++ x ++ ":"]
    FAssign(x, e) -> [ind ++ x ++ " := " ++ show-fexpr(e)]
    FPrint(e) -> [ind ++ "print " ++ show-fexpr(e)]
    FLoop(c, b, early, body) ->
      if lvl >= 4 then
        // e4 case requires a scrutinee; the early-break guard is bool-typed
        val early-stmt = match early
          Just(g) -> [ind ++ "      case " ++ show-fexpr(g) ++ " { true -> { break } _ -> { } }"]
          Nothing -> []
        [ind ++ c ++ " := " ++ b.show,
         ind ++ "loop {",
         ind ++ "  case (" ++ c ++ " == 0) {",
         ind ++ "    true -> { break }",
         ind ++ "    _ -> {"]
          ++ early-stmt
          ++ show-fstmts(body, ind ++ "      ", lvl)
          ++ [ind ++ "      " ++ c ++ " := " ++ c ++ " - 1",
              ind ++ "    }",
              ind ++ "  }",
              ind ++ "}"]
      elif lvl >= 2 then
        val early-arm = match early
          Just(g) -> [ind ++ "    " ++ show-fexpr(g) ++ " -> break"]
          Nothing -> []
        [ind ++ c ++ " := " ++ b.show,
         ind ++ "loop {",
         ind ++ "  case {",
         ind ++ "    (" ++ c ++ " == 0) -> break"]
          ++ early-arm
          ++ [ind ++ "    1 -> {"]
          ++ show-fstmts(body, ind ++ "      ", lvl)
          ++ [ind ++ "      " ++ c ++ " := " ++ c ++ " - 1",
              ind ++ "    }",
              ind ++ "  }",
              ind ++ "}"]
      else
        [ind ++ c ++ " := " ++ b.show,
         ind ++ "loop {",
         ind ++ "  break_ifz " ++ c]
          ++ show-fstmts(body, ind ++ "  ", lvl)
          ++ [ind ++ "  " ++ c ++ " := " ++ c ++ " - 1",
              ind ++ "}"]
    FIf(cond, body) ->
      if lvl >= 4 then
        // Works for int and bool conditions: 0 and false skip the body,
        // anything else falls to the wildcard arm (truthy semantics).
        [ind ++ "case " ++ cond ++ " {",
         ind ++ "  0 -> { }",
         ind ++ "  false -> { }",
         ind ++ "  _ -> {"]
          ++ show-fstmts(body, ind ++ "    ", lvl)
          ++ [ind ++ "  }",
              ind ++ "}"]
      elif lvl >= 2 then
        [ind ++ "case {",
         ind ++ "  " ++ cond ++ " -> {"]
          ++ show-fstmts(body, ind ++ "    ", lvl)
          ++ [ind ++ "  }",
              ind ++ "}"]
      else
        [ind ++ "loop {",
         ind ++ "  break_ifz " ++ cond]
          ++ show-fstmts(body, ind ++ "  ", lvl)
          ++ [ind ++ "  break_ifz 0",
              ind ++ "}"]
    FCase(arms) ->
      val arm-lines = arms.flatmap fn((g, body))
        [ind ++ "  " ++ show-fexpr(g) ++ " -> {"]
          ++ show-fstmts(body, ind ++ "    ", lvl)
          ++ [ind ++ "  }"]
      [ind ++ "case {"] ++ arm-lines ++ [ind ++ "}"]
    FCaseP(scrut, arms) ->
      val arm-lines = arms.flatmap fn((p, body))
        [ind ++ "  " ++ show-fpat(p) ++ " -> {"]
          ++ show-fstmts(body, ind ++ "    ", lvl)
          ++ [ind ++ "  }"]
      [ind ++ "case " ++ scrut ++ " {"] ++ arm-lines ++ [ind ++ "}"]

fun show-fstmts(ss: list<fstmt>, ind: string, lvl: int): div list<string>
  ss.flatmap(fn(s) show-fstmt(s, ind, lvl))

// === Main ===

// Regenerate with a different internal seed if values explode
// (multiplication inside loops); keeps interpreter runtimes sane.
// An over-cap program has an aborted (wrong) co-evaluation, so it must
// never be emitted: after 10 over-cap attempts, fail loudly instead.
fun generate(seed: int, size: int, lvl: int, attempt: int): <div,exn> (list<fstmt>, list<string>, string)
  val prog = gen-program(seed * 1000 + attempt * 137, size, lvl)
  val (out, m, viol) = run-program(prog)
  if m <= mag-cap then (prog, out, viol)
  elif attempt < 9 then generate(seed, size, lvl, attempt + 1)
  else throw("efuzz: magnitude cap exceeded on all attempts for seed " ++ seed.show)

pub fun main()
  val args = get-args()
  val seed = match args
    Cons(s, _) -> s.parse-int.default(42)
    Nil -> 42
  val size = match args
    Cons(_, Cons(s, _)) -> s.parse-int.default(20)
    _ -> 20
  val lvl = match args
    Cons(_, Cons(_, Cons(s, _))) -> s.parse-int.default(1)
    _ -> 1

  val (prog, expected, viol) = generate(seed, size, lvl, 0)
  println("// efuzz seed=" ++ seed.show ++ " size=" ++ size.show ++ " level=" ++ lvl.show)
  println("// violations: " ++ (if viol == "" then "none" else viol))
  show-fstmts(prog, "", lvl).foreach(println)
  expected.foreach(fn(line) println("// expect: " ++ line))
