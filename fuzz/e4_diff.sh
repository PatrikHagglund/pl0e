#!/bin/bash
# Differential fuzzing driver for e4 (see docs/FUZZING.md)
#
# Generates random e4 programs with efuzz (level 4) and runs them on e4peg
# (the only e4 implementation). Compares the output against the generator's
# co-evaluated expectation, then runs the bidirectional enforce-mode oracle:
# a clean program must not trip --enforce, and a program whose co-evaluation
# triggered an erroneous construct (div0, nomatch, oob) must halt with a
# Violation of exactly that kind.
#
# Timeouts are 30s: e4peg takes >10s on some generated programs (PEG
# backtracking - a candidate for the planned --stats fuel investigation).
set -u

EFUZZ="$1"
E4PEG="$2"
shift 2

COUNT=20
SEED0=1
SIZE=20
if [ "${1:-}" = "--" ]; then
    shift
    COUNT=${1:-20}
    SEED0=${2:-1}
    SIZE=${3:-20}
fi

OUTDIR="${TEST_UNDECLARED_OUTPUTS_DIR:-${BUILD_WORKING_DIRECTORY:-$PWD}}/fuzz-failures"
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

pass=0
fail=0

# Program output lines: integers, booleans, and arrays like "(1; 2;)"
run_filtered() {
    timeout 30 "$@" 2>/dev/null | grep -E '^-?[0-9]+$|^true$|^false$|^\(.*\)$'
    return 0
}

for ((seed = SEED0; seed < SEED0 + COUNT; seed++)); do
    prog="$TMP/prog.e4"
    if ! timeout 30 "$EFUZZ" "$seed" "$SIZE" 4 > "$prog"; then
        echo "FAIL seed=$seed: generator error"
        fail=$((fail + 1))
        continue
    fi
    expected=$(sed -n 's|^// expect: ||p' "$prog")

    run_filtered "$E4PEG" "$prog" > "$TMP/out_e4peg"

    mismatches=""
    if [ "$(cat "$TMP/out_e4peg")" != "$expected" ]; then
        mismatches="$mismatches e4peg"
    fi

    viol=$(sed -n 's|^// violations: ||p' "$prog")
    enforce_raw=$(timeout 30 "$E4PEG" --enforce "$prog" 2>/dev/null)
    if [ "$viol" = "none" ]; then
        if echo "$enforce_raw" | grep -q "^Violation"; then
            mismatches="$mismatches e4peg-enforce(spurious-violation)"
        elif [ "$(echo "$enforce_raw" | grep -E '^-?[0-9]+$|^true$|^false$|^\(.*\)$')" != "$expected" ]; then
            mismatches="$mismatches e4peg-enforce"
        fi
    else
        if ! echo "$enforce_raw" | grep -q "^Violation ($viol)"; then
            mismatches="$mismatches e4peg-enforce(missed-$viol)"
        fi
    fi

    if [ -z "$mismatches" ]; then
        pass=$((pass + 1))
    else
        echo "FAIL seed=$seed:$mismatches"
        fail=$((fail + 1))
        mkdir -p "$OUTDIR"
        cp "$prog" "$OUTDIR/e4_seed_$seed.e4"
        cp "$TMP/out_e4peg" "$OUTDIR/e4_seed_${seed}_e4peg.out"
        echo "  program and outputs saved to $OUTDIR/e4_seed_$seed*"
    fi
done

echo ""
echo "efuzz e4 diff: $pass passed, $fail failed (seeds $SEED0..$((SEED0 + COUNT - 1)), size $SIZE)"
[ $fail -eq 0 ]
