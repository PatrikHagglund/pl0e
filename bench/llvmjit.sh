#!/bin/bash
# LLVM JIT benchmark using hermetic lli
set -e

FACTORIAL_LL="$1"
RUNTIME_LL="$2"
LLI="$3"
LLVM_LINK="$4"
BUILTINS="$5"
ITERS="${6:-2000}"
N="${7:-31}"

# Link runtime with program
LINKED=$(mktemp --suffix=.ll)
"$LLVM_LINK" -S "$RUNTIME_LL" "$FACTORIAL_LL" -o "$LINKED"

echo "=== LLVM JIT (lli) ==="
time "$LLI" --extra-archive="$BUILTINS" "$LINKED" "$ITERS" "$N"

rm -f "$LINKED"
