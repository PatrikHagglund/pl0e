#!/bin/bash
set -e

pass=0
fail=0
TIMEOUT=5

check() {
    name="$1"
    cmd="$2"
    expected="$3"
    
    actual=$(timeout $TIMEOUT bash -c "$cmd" 2>&1 | grep -E "^-?[0-9]+$|^true$|^false$" | tr '\n' ' ' | sed 's/ $//') || { echo "FAIL $name (timeout/error)"; fail=$((fail+1)); return; }
    if [ "$actual" = "$expected" ]; then
        echo "PASS $name"
        pass=$((pass+1))
    else
        echo "FAIL $name"
        printf "  expected: %s\n" "$expected"
        printf "  actual: %s\n" "$actual"
        fail=$((fail+1))
    fi
}

run_e3() {
    local code="$1"
    shift
    local tmp=$(mktemp --suffix=.e3)
    echo -e "$code" > "$tmp"
    "$E3" "$tmp" "$@"
    rm -f "$tmp"
}

E3="$1"
EXAMPLES="$2"

# Basic arithmetic
check "factorial" "$E3 $EXAMPLES/factorial.e3 1 5" "120"
check "gcd" "$E3 $EXAMPLES/gcd.e3 48 18" "6"
check "collatz" "$E3 $EXAMPLES/collatz.e3 5" "5 16 8 4 2 1"

# Inline tests using temp files
TMP=$(mktemp --suffix=.e3)

echo 'print 2 + 3 * 4' > "$TMP"
check "basic_arith" "$E3 $TMP" "14"

echo 'print 5 > 3' > "$TMP"
check "comparison" "$E3 $TMP" "true"

echo 'print true && false' > "$TMP"
check "boolean_and" "$E3 $TMP" "false"

echo 'print true || false' > "$TMP"
check "boolean_or" "$E3 $TMP" "true"

echo 'print -5 + 10' > "$TMP"
check "negation" "$E3 $TMP" "5"

echo -e 'x := 5\nprint case { x > 3 -> 1, true -> 0 }' > "$TMP"
check "case_expr" "$E3 $TMP" "1"

echo -e 'x := 2\ncase { x == 1 -> { print 10 } x == 2 -> { print 20 } true -> { print 0 } }' > "$TMP"
check "case_stmt" "$E3 $TMP" "20"

echo -e 'i := 3\nloop { case { i == 0 -> { break } true -> { print i\n i := i - 1 } } }' > "$TMP"
check "loop_break" "$E3 $TMP" "3 2 1"

echo -e 'f := (x) -> x + 1\nprint f 5' > "$TMP"
check "closure" "$E3 $TMP" "6"

echo -e 'add := (x) -> (y) -> x + y\nprint add 3 4' > "$TMP"
check "closure_curry" "$E3 $TMP" "7"

rm -f "$TMP"

echo ""
echo "Results: $pass passed, $fail failed"
[ $fail -eq 0 ]
