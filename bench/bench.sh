#!/bin/bash
# Benchmark script for e1 implementations

FACTORIAL_CPP="$1"
FACTORIAL_LLVM="$2"
E1="$3"
FACTORIAL_E1="$4"
E1PEG="$5"
E2PEG="$6"
FACTORIAL_E2="$7"
E1_KOKA="$8"
FACTORIAL_LL="$9"
RUNTIME_LL="${10}"
LLI="${11}"
LLVM_LINK="${12}"
BUILTINS="${13}"

# Default iterations and n
ITERS=2000
N=31
shift 13 2>/dev/null || true
if [ "$1" = "--" ]; then
    shift
    ITERS=${1:-2000}
    N=${2:-31}
fi

echo "Benchmark: factorial($N) x $ITERS iterations"
echo ""

if [ -n "$FACTORIAL_CPP" ] && [ -x "$FACTORIAL_CPP" ]; then
    echo "=== C++ backend ==="
    time "$FACTORIAL_CPP" "$ITERS" "$N"
    echo ""
fi

if [ -n "$FACTORIAL_LLVM" ] && [ -x "$FACTORIAL_LLVM" ]; then
    echo "=== LLVM backend ==="
    time "$FACTORIAL_LLVM" "$ITERS" "$N"
    echo ""
fi

if [ -n "$LLI" ] && [ -x "$LLI" ]; then
    echo "=== LLVM JIT (lli) ==="
    LINKED=$(mktemp --suffix=.ll)
    "$LLVM_LINK" -S "$RUNTIME_LL" "$FACTORIAL_LL" -o "$LINKED" 2>/dev/null
    time "$LLI" --extra-archive="$BUILTINS" "$LINKED" "$ITERS" "$N"
    rm -f "$LINKED"
    echo ""
fi

if [ -n "$E1" ] && [ -x "$E1" ]; then
    echo "=== C++ interpreter ==="
    time "$E1" "$FACTORIAL_E1" "$ITERS" "$N"
    echo ""
fi

if [ -n "$E1_KOKA" ] && [ -x "$E1_KOKA" ]; then
    echo "=== Koka interpreter ==="
    time "$E1_KOKA" "$FACTORIAL_E1" "$ITERS" "$N"
    echo ""
fi

if [ -n "$E1PEG" ] && [ -x "$E1PEG" ]; then
    echo "=== Koka PEG e1 ==="
    time "$E1PEG" "$FACTORIAL_E1" "$ITERS" "$N"
    echo ""
fi

if [ -n "$E2PEG" ] && [ -x "$E2PEG" ]; then
    echo "=== Koka PEG e2 ==="
    time "$E2PEG" "$FACTORIAL_E2" "$ITERS" "$N"
    echo ""
fi
