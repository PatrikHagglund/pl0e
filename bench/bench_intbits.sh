#!/bin/bash
# Benchmark comparing INT_BITS settings (hermetic)
# Usage: bench_intbits.sh <e1_int0_limb32> <e1_int0_limb64> <e1_int0_limb128> <e1_int64> <e1_int512> <factorial.e1>

set -e

E1_INT0_LIMB32="$1"
E1_INT0_LIMB64="$2"
E1_INT0_LIMB128="$3"
E1_INT64="$4"
E1_INT512="$5"
FACTORIAL_E1="$6"

ITERS=2000
N=31

echo "Benchmark: factorial($N) x $ITERS iterations"
echo "Comparing INT_BITS settings (hermetic build)"
echo ""

echo "========== INT_BITS=0, LIMB_BITS=32 =========="
echo "=== C++ interpreter ==="
time "$E1_INT0_LIMB32" "$FACTORIAL_E1" $ITERS $N
echo ""

echo "========== INT_BITS=0, LIMB_BITS=64 =========="
echo "=== C++ interpreter ==="
time "$E1_INT0_LIMB64" "$FACTORIAL_E1" $ITERS $N
echo ""

echo "========== INT_BITS=0, LIMB_BITS=128 =========="
echo "=== C++ interpreter ==="
time "$E1_INT0_LIMB128" "$FACTORIAL_E1" $ITERS $N
echo ""

echo "========== INT_BITS=64 =========="
echo "=== C++ interpreter ==="
time "$E1_INT64" "$FACTORIAL_E1" $ITERS $N
echo ""

echo "========== INT_BITS=512 =========="
echo "=== C++ interpreter ==="
time "$E1_INT512" "$FACTORIAL_E1" $ITERS $N
echo ""
