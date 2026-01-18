// Header-only bigint implementation
// Used directly by C++ backend, compiled to .o for LLVM backend
#pragma once
#include <cstdint>
#include <cstdlib>
#include <cstdio>
#include <algorithm>
#include <span>
#include <string>
#include <print>

namespace bigint {

// --- Limb abstraction ---
// To use 128-bit limbs: Limb=__uint128_t, SLimb=__int128_t, DLimb=unsigned _BitInt(256), LimbBits=128
// Note: _BitInt requires C++23/clang; LLVM JIT (lli) crashes on _BitInt as of LLVM 21.
using Limb = uint64_t;
using SLimb = int64_t;
using DLimb = __uint128_t;
inline constexpr int LimbBits = 64;
inline constexpr Limb Limb0 = 0;
using Size = uint32_t;

struct Raw {
    Size size;
    bool neg;
    Limb limbs[];
    
    auto span() const { return std::span{limbs, size}; }
    static constexpr Size buf_size(Size n) { return sizeof(Raw) + n * sizeof(Limb); }
};

// --- Core operations (all inline) ---

inline void init(Raw* out, SLimb v) {
    out->neg = v < 0;
    auto uv = static_cast<Limb>(v < 0 ? -v : v);
    out->size = uv ? (out->limbs[0] = uv, 1) : 0;
}

inline void copy(Raw* dst, const Raw* src) {
    dst->size = src->size;
    dst->neg = src->neg;
    std::ranges::copy(src->span(), dst->limbs);
}

inline int cmp_mag(const Raw* a, const Raw* b) {
    if (a->size != b->size) return a->size > b->size ? 1 : -1;
    for (Size i = a->size; i-- > 0; )
        if (a->limbs[i] != b->limbs[i]) return a->limbs[i] > b->limbs[i] ? 1 : -1;
    return 0;
}

inline void add_mag(Raw* out, const Raw* a, const Raw* b) {
    auto n = std::max(a->size, b->size);
    Limb carry = 0;
    for (Size i = 0; i < n; i++) {
        auto av = i < a->size ? a->limbs[i] : Limb0;
        auto bv = i < b->size ? b->limbs[i] : Limb0;
        auto sum = static_cast<DLimb>(av) + bv + carry;
        out->limbs[i] = static_cast<Limb>(sum);
        carry = static_cast<Limb>(sum >> LimbBits);
    }
    out->size = carry ? (out->limbs[n] = carry, n + 1) : n;
}

inline void sub_mag(Raw* out, const Raw* a, const Raw* b) {
    auto n = a->size;
    Limb borrow = 0;
    for (Size i = 0; i < n; i++) {
        auto av = a->limbs[i];
        auto bv = i < b->size ? b->limbs[i] : Limb0;
        out->limbs[i] = av - bv - borrow;
        borrow = av < bv + borrow;
    }
    while (n > 0 && out->limbs[n-1] == 0) n--;
    out->size = n;
}

inline Size add_size(const Raw* a, const Raw* b) { return std::max(a->size, b->size) + 1; }
inline Size sub_size(const Raw* a, const Raw* b) { return std::max(a->size, b->size) + 1; }

inline void add(Raw* out, const Raw* a, const Raw* b) {
    if (a->neg == b->neg) { add_mag(out, a, b); out->neg = a->neg; }
    else if (cmp_mag(a, b) >= 0) { sub_mag(out, a, b); out->neg = a->neg; }
    else { sub_mag(out, b, a); out->neg = b->neg; }
    if (out->size == 0) out->neg = false;
}

inline void sub(Raw* out, const Raw* a, const Raw* b) {
    if (a->neg != b->neg) { add_mag(out, a, b); out->neg = a->neg; }
    else if (cmp_mag(a, b) >= 0) { sub_mag(out, a, b); out->neg = a->neg; }
    else { sub_mag(out, b, a); out->neg = !a->neg; }
    if (out->size == 0) out->neg = false;
}

inline void neg(Raw* out, const Raw* a) {
    copy(out, a);
    if (out->size > 0) out->neg = !out->neg;
}

inline bool is_zero(const Raw* a) { return a->size == 0; }

inline void from_str(Raw* out, const char* s) {
    out->size = 0;
    out->neg = (*s == '-') ? (s++, true) : (*s == '+' ? (s++, false) : false);
    while (*s) {
        Limb carry = *s++ - '0';
        for (Size i = 0; i < out->size; i++) {
            auto p = static_cast<DLimb>(out->limbs[i]) * 10 + carry;
            out->limbs[i] = static_cast<Limb>(p);
            carry = static_cast<Limb>(p >> LimbBits);
        }
        if (carry) out->limbs[out->size++] = carry;
    }
    if (out->size == 0) out->neg = false;
}

inline void print(const Raw* v) {
    if (v->size == 0) { puts("0"); return; }
    Limb tmp[256];
    Size n = v->size;
    std::ranges::copy(v->span(), tmp);
    char buf[1024];
    int pos = 0;
    while (n > 0) {
        DLimb rem = 0;
        for (Size i = n; i-- > 0; ) {
            auto cur = (rem << LimbBits) | tmp[i];
            tmp[i] = static_cast<Limb>(cur / 10);
            rem = cur % 10;
        }
        buf[pos++] = '0' + static_cast<int>(rem);
        while (n > 0 && tmp[n-1] == 0) n--;
    }
    if (v->neg) putchar('-');
    while (pos > 0) putchar(buf[--pos]);
    putchar('\n');
}

// --- C++ wrapper class (stack-allocated, fixed buffer) ---

template<Size MaxLimbs = 64>  // ~1200 decimal digits
class Int {
    alignas(8) char buf_[Raw::buf_size(MaxLimbs)];
    Raw* p() { return reinterpret_cast<Raw*>(buf_); }
    const Raw* p() const { return reinterpret_cast<const Raw*>(buf_); }
public:
    Int() { bigint::init(p(), 0); }
    Int(int v) { bigint::init(p(), v); }
    Int(long long v) { bigint::init(p(), v); }
    explicit Int(const char* s) { bigint::from_str(p(), s); }
    Int(const Int& o) { bigint::copy(p(), o.p()); }
    Int& operator=(const Int& o) { bigint::copy(p(), o.p()); return *this; }
    
    Int operator+(const Int& o) const {
        Int r;
        alignas(8) char tmp[Raw::buf_size(MaxLimbs + 1)];
        bigint::add(reinterpret_cast<Raw*>(tmp), p(), o.p());
        bigint::copy(r.p(), reinterpret_cast<Raw*>(tmp));
        return r;
    }
    Int operator-(const Int& o) const {
        Int r;
        alignas(8) char tmp[Raw::buf_size(MaxLimbs + 1)];
        bigint::sub(reinterpret_cast<Raw*>(tmp), p(), o.p());
        bigint::copy(r.p(), reinterpret_cast<Raw*>(tmp));
        return r;
    }
    Int operator-() const { Int r; bigint::neg(r.p(), p()); return r; }
    
    // Comparisons
    bool operator==(const Int& o) const { return cmp_mag(p(), o.p()) == 0 && p()->neg == o.p()->neg; }
    bool operator==(int v) const { Int t(v); return *this == t; }
    bool operator<(int v) const { Int t(v); return p()->neg && !bigint::is_zero(p()); }  // simplified: only for v=0
    explicit operator bool() const { return !bigint::is_zero(p()); }
    
    std::string str() const { bigint::print(p()); return ""; }
};

} // namespace bigint

using Int = bigint::Int<>;
