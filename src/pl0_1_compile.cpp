// PL/0 Level 1 Compiler - C++ and LLVM IR backends
#include "pl0_1.hpp"
#include <unordered_set>
#include <cstring>

auto collect_vars(std::vector<StmtPtr>& prog) {
    std::unordered_set<std::string> vars;
    auto go = [&](auto&& go, Stmt* s) -> void {
        if (auto* d = dynamic_cast<DeclStmt*>(s)) vars.insert(d->name);
        else if (auto* a = dynamic_cast<AssignStmt*>(s)) vars.insert(a->name);
        else if (auto* b = dynamic_cast<BlockStmt*>(s))
            for (auto& x : b->stmts) go(go, x.get());
        else if (auto* l = dynamic_cast<LoopStmt*>(s)) go(go, l->body.get());
    };
    for (auto& s : prog) go(go, s.get());
    for (int i = 1; i <= ARG_COUNT; ++i) vars.erase(std::format("arg{}", i));
    return vars;
}

struct CppGen {
    int lbl = 0;
    std::vector<int> ex;

    void e(Expr* x) {
        if (auto* n = dynamic_cast<NumberExpr*>(x)) std::print("Int({})", n->val);
        else if (auto* v = dynamic_cast<VarExpr*>(x)) std::print("{}", v->name);
        else if (auto* u = dynamic_cast<NegExpr*>(x)) { std::print("-("); e(u->e.get()); std::print(")"); }
        else if (auto* b = dynamic_cast<BinExpr*>(x)) {
            std::print("("); e(b->l.get()); std::print(" {} ", b->op); e(b->r.get()); std::print(")");
        }
    }

    void s(Stmt* x, int d = 1) {
        auto ind = [d]{ for (int i = 0; i < d; i++) std::print("  "); };
        if (auto* a = dynamic_cast<AssignStmt*>(x)) {
            ind(); std::print("{} = ", a->name); e(a->e.get()); std::println(";");
        }
        else if (auto* b = dynamic_cast<BlockStmt*>(x))
            for (auto& t : b->stmts) s(t.get(), d);
        else if (auto* l = dynamic_cast<LoopStmt*>(x)) {
            ex.push_back(lbl++);
            ind(); std::println("for(;;) {{");
            s(l->body.get(), d + 1);
            ind(); std::println("}} L{}:;", ex.back());
            ex.pop_back();
        }
        else if (auto* b = dynamic_cast<BreakIfzStmt*>(x)) {
            ind(); std::print("if ("); e(b->cond.get()); std::println(" == 0) goto L{};", ex.back());
        }
        else if (auto* p = dynamic_cast<PrintStmt*>(x)) {
            ind();
            if constexpr (INT_BITS > 0 && INT_BITS <= 128) {
                std::print("std::println(\"{{}}\", to_string("); e(p->e.get()); std::println("));");
            } else {
                std::print("std::println(\"{{}}\", ("); e(p->e.get()); std::println(").str());");
            }
        }
    }

    void gen(std::vector<StmtPtr>& prog) {
        std::println("#include <print>\n#include <boost/multiprecision/cpp_int.hpp>");
        if constexpr (INT_BITS == 0)
            std::println("using Int = boost::multiprecision::cpp_int;");
        else if constexpr (INT_BITS <= 128) {
            std::println("using Int = __int128;");
            std::println("std::string to_string(Int v) {{");
            std::println("  if (!v) return \"0\"; std::string s; bool n = v < 0; if (n) v = -v;");
            std::println("  while (v) {{ s = char('0' + v % 10) + s; v /= 10; }} return n ? \"-\" + s : s; }}");
        } else {
            std::println("using Int = boost::multiprecision::number<boost::multiprecision::cpp_int_backend<");
            std::println("  {0}, {0}, boost::multiprecision::signed_magnitude, boost::multiprecision::unchecked, void>>;", INT_BITS);
        }
        std::println("int main(int argc, char** argv) {{");
        for (auto& v : collect_vars(prog)) std::println("  Int {} = 0;", v);
        for (int i = 1; i <= ARG_COUNT; ++i) {
            if constexpr (INT_BITS > 0 && INT_BITS <= 128)
                std::println("  Int arg{0} = argc > {0} ? std::atoll(argv[{0}]) : 0;", i);
            else
                std::println("  Int arg{0} = argc > {0} ? Int(argv[{0}]) : Int(0);", i);
        }
        for (auto& x : prog) s(x.get());
        std::println("}}");
    }
};

struct LlvmGen {
    int t = 0, lbl = 0;
    std::vector<int> ex;
    bool bigint = (INT_BITS == 0);
    std::string I = bigint ? "ptr" : std::format("i{}", INT_BITS);

    std::string e(Expr* x) {
        if (auto* n = dynamic_cast<NumberExpr*>(x)) {
            if (bigint) {
                auto r = std::format("%t{}", t++);
                std::println("  {} = call ptr @bi_new(i64 {})", r, n->val);
                return r;
            }
            return std::to_string(n->val);
        }
        if (auto* v = dynamic_cast<VarExpr*>(x)) {
            auto r = std::format("%t{}", t++);
            std::println("  {} = load {}, ptr %{}", r, I, v->name);
            return r;
        }
        if (auto* u = dynamic_cast<NegExpr*>(x)) {
            auto r = std::format("%t{}", t++);
            if (bigint) std::println("  {} = call ptr @bi_neg(ptr {})", r, e(u->e.get()));
            else std::println("  {} = sub {} 0, {}", r, I, e(u->e.get()));
            return r;
        }
        if (auto* b = dynamic_cast<BinExpr*>(x)) {
            auto l = e(b->l.get()), rv = e(b->r.get()), o = std::format("%t{}", t++);
            if (bigint) std::println("  {} = call ptr @bi_{}(ptr {}, ptr {})", o, b->op == '+' ? "add" : "sub", l, rv);
            else std::println("  {} = {} {} {}, {}", o, b->op == '+' ? "add" : "sub", I, l, rv);
            return o;
        }
        return bigint ? "null" : "0";
    }

    // Check if variable appears in expression
    bool uses_var(Expr* x, const std::string& var) {
        if (auto* v = dynamic_cast<VarExpr*>(x)) return v->name == var;
        if (auto* u = dynamic_cast<NegExpr*>(x)) return uses_var(u->e.get(), var);
        if (auto* b = dynamic_cast<BinExpr*>(x)) return uses_var(b->l.get(), var) || uses_var(b->r.get(), var);
        return false;
    }

    // Emit in-place assignment for bigint: dst := expr (modifies dst directly)
    // Only safe when dst doesn't appear in RHS of binary ops after first use
    void assign_inplace(const std::string& dst, Expr* x) {
        if (auto* n = dynamic_cast<NumberExpr*>(x)) {
            auto p = std::format("%t{}", t++);
            std::println("  {} = load ptr, ptr %{}", p, dst);
            std::println("  call void @bi_set_i(ptr {}, i64 {})", p, n->val);
        } else if (auto* v = dynamic_cast<VarExpr*>(x)) {
            auto p = std::format("%t{}", t++), s = std::format("%t{}", t++);
            std::println("  {} = load ptr, ptr %{}", p, dst);
            std::println("  {} = load ptr, ptr %{}", s, v->name);
            std::println("  call void @bi_set(ptr {}, ptr {})", p, s);
        } else if (auto* b = dynamic_cast<BinExpr*>(x)) {
            // x := a + b  ->  x = a; x += b  (only if dst not in b)
            if (uses_var(b->r.get(), dst)) {
                // Fallback: evaluate fully then store
                auto val = e(x), p = std::format("%t{}", t++);
                std::println("  {} = load ptr, ptr %{}", p, dst);
                std::println("  call void @bi_set(ptr {}, ptr {})", p, val);
            } else {
                assign_inplace(dst, b->l.get());
                auto rv = e(b->r.get()), p = std::format("%t{}", t++);
                std::println("  {} = load ptr, ptr %{}", p, dst);
                std::println("  call void @bi_{}_to(ptr {}, ptr {})", b->op == '+' ? "add" : "sub", p, rv);
            }
        } else if (auto* u = dynamic_cast<NegExpr*>(x)) {
            assign_inplace(dst, u->e.get());
            auto p = std::format("%t{}", t++);
            std::println("  {} = load ptr, ptr %{}", p, dst);
            std::println("  call void @bi_neg_in(ptr {})", p);
        } else {
            // Fallback
            std::println("  store {} {}, ptr %{}", I, e(x), dst);
        }
    }

    void s(Stmt* x) {
        if (auto* a = dynamic_cast<AssignStmt*>(x)) {
            if (bigint) assign_inplace(a->name, a->e.get());
            else std::println("  store {} {}, ptr %{}", I, e(a->e.get()), a->name);
        }
        else if (auto* b = dynamic_cast<BlockStmt*>(x))
            for (auto& y : b->stmts) s(y.get());
        else if (auto* l = dynamic_cast<LoopStmt*>(x)) {
            int h = lbl++, z = lbl++;
            ex.push_back(z);
            std::println("  br label %L{}\nL{}:", h, h);
            s(l->body.get());
            std::println("  br label %L{}\nL{}:", h, z);
            ex.pop_back();
        }
        else if (auto* b = dynamic_cast<BreakIfzStmt*>(x)) {
            auto c = e(b->cond.get());
            auto r = std::format("%t{}", t++);
            int n = lbl++;
            if (bigint) {
                std::println("  {} = call i32 @bi_is_zero(ptr {})", r, c);
                std::println("  %cmp{} = icmp ne i32 {}, 0", n, r);
                std::println("  br i1 %cmp{}, label %L{}, label %L{}\nL{}:", n, ex.back(), n, n);
            } else {
                std::println("  {} = icmp eq {} {}, 0", r, I, c);
                std::println("  br i1 {}, label %L{}, label %L{}\nL{}:", r, ex.back(), n, n);
            }
        }
        else if (auto* p = dynamic_cast<PrintStmt*>(x)) {
            if (bigint) std::println("  call void @bi_print(ptr {})", e(p->e.get()));
            else std::println("  call void @print_int({} {})", I, e(p->e.get()));
        }
    }

    void gen(std::vector<StmtPtr>& prog) {
        if (bigint) {
            std::println(R"(declare ptr @bi_new(i64)
declare ptr @bi_add(ptr, ptr)
declare ptr @bi_sub(ptr, ptr)
declare ptr @bi_neg(ptr)
declare i32 @bi_is_zero(ptr)
declare void @bi_print(ptr)
declare ptr @bi_from_str(ptr)
declare void @bi_set(ptr, ptr)
declare void @bi_set_i(ptr, i64)
declare void @bi_add_to(ptr, ptr)
declare void @bi_sub_to(ptr, ptr)
declare void @bi_neg_in(ptr)

define i32 @main(i32 %argc, ptr %argv) {{
entry:)");
            for (auto& v : collect_vars(prog))
                std::println("  %{0} = alloca ptr\n  %{0}_init = call ptr @bi_new(i64 0)\n  store ptr %{0}_init, ptr %{0}", v);
            auto parse_arg = [](int idx) {
                std::println("  %has{0} = icmp sgt i32 %argc, {0}", idx);
                std::println("  br i1 %has{0}, label %read{0}, label %def{0}", idx);
                std::println("read{}:", idx);
                std::println("  %p{0} = getelementptr ptr, ptr %argv, i32 {0}", idx);
                std::println("  %s{0} = load ptr, ptr %p{0}", idx);
                std::println("  %v{0} = call ptr @bi_from_str(ptr %s{0})", idx);
                std::println("  br label %done{}", idx);
                std::println("def{}:", idx);
                std::println("  %z{0} = call ptr @bi_new(i64 0)", idx);
                std::println("  br label %done{}", idx);
                std::println("done{}:", idx);
                std::println("  %a{0} = phi ptr [ %v{0}, %read{0} ], [ %z{0}, %def{0} ]", idx);
            };
            for (int i = 1; i <= ARG_COUNT; ++i) {
                std::println("  %arg{} = alloca ptr", i); parse_arg(i); std::println("  store ptr %a{0}, ptr %arg{0}", i);
            }
        } else {
            auto ret = INT_BITS <= 32 ? "  %v = trunc i64 %v64 to i32\n  ret i32 %v"
                     : INT_BITS <= 64 ? "  ret i64 %v64"
                     : std::format("  %v = sext i64 %v64 to {0}\n  ret {0} %v", I);
            auto dig = INT_BITS <= 32 ? "  %c = add i32 %rem, 48"
                     : std::format("  %d = trunc {} %rem to i32\n  %c = add i32 %d, 48", I);
            std::println(R"(declare i32 @putchar(i32)
declare i64 @strtol(ptr, ptr, i32)

define void @print_int_rec({0} %v) {{
  %z = icmp eq {0} %v, 0
  br i1 %z, label %done, label %print
print:
  %div = sdiv {0} %v, 10
  %rem = srem {0} %v, 10
  call void @print_int_rec({0} %div)
{2}
  call i32 @putchar(i32 %c)
  br label %done
done:
  ret void
}}

define void @print_int({0} %v) {{
  %z = icmp eq {0} %v, 0
  br i1 %z, label %zero, label %nonzero
zero:
  call i32 @putchar(i32 48)
  br label %done
nonzero:
  call void @print_int_rec({0} %v)
  br label %done
done:
  call i32 @putchar(i32 10)
  ret void
}}

define {0} @parse_arg(i32 %argc, ptr %argv, i32 %idx) {{
  %has = icmp sgt i32 %argc, %idx
  br i1 %has, label %read, label %default
read:
  %i = sext i32 %idx to i64
  %p = getelementptr ptr, ptr %argv, i64 %i
  %s = load ptr, ptr %p
  %v64 = call i64 @strtol(ptr %s, ptr null, i32 10)
{1}
default:
  ret {0} 0
}}

define i32 @main(i32 %argc, ptr %argv) {{
entry:)", I, ret, dig);
            for (auto& v : collect_vars(prog))
                std::println("  %{} = alloca {}\n  store {} 0, ptr %{}", v, I, I, v);
            for (int i = 1; i <= ARG_COUNT; ++i)
                std::println("  %arg{0} = alloca {1}\n  %a{0} = call {1} @parse_arg(i32 %argc, ptr %argv, i32 {0})\n  store {1} %a{0}, ptr %arg{0}", i, I);
        }
        for (auto& x : prog) s(x.get());
        std::println("  ret i32 0\n}}");
    }
};

int main(int argc, char** argv) {
    bool llvm = false;
    const char* file = nullptr;
    for (int i = 1; i < argc; i++)
        if (!strcmp(argv[i], "--llvm")) llvm = true; else file = argv[i];
    if (!file) { std::println(stderr, "Usage: {} [--llvm] <file>", argv[0]); return 1; }
    auto prog = parse_program(read_file(file));
    if (!prog) { std::println(stderr, "Error: {}", prog.error()); return 1; }
    if (llvm) LlvmGen{}.gen(*prog);
    else CppGen{}.gen(*prog);
}
