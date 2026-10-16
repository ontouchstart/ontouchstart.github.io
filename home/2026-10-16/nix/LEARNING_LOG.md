# Learning Session Log: Nix Source-Code Approach

This log documents the findings and techniques used during the initial exploration of the Nix source code and engine.

## Core Architecture & Mapping
Through exploration of the `/home/2026-10-16/nix/nix/` directory, the following mappings were established between the Nix CLI and its C++ implementation:

*   **`nix build`** $\rightarrow$ `src/nix/nix-build/nix-build.cc`
*   **`nix eval`** $\rightarrow$ `src/nix/nix-instantiate/nix-instantiate.cc`
*   **`nix-store`** $\rightarrow$ `src/nix/nix-store/nix-store.cc`
*   **`nix-env`** $\rightarrow$ `src/nix/nix-env/nix-env.cc`

The engine is primarily written in C++, which is the primary target for deep-dive analysis of the parser and evaluator.

## Successful Trace-Driven Exercises

### 1. Basic Arithmetic Evaluation
Verified that the engine correctly evaluates arithmetic expressions using the `eval` subcommand.
**Command:**
```bash
nix run /home/2026-10-16/nix/nix -- eval --expr "$(cat /home/2026-10-16/nix/nix/tests/functional/lang/eval-okay-arithmetic.nix)"
```
**Result:**
```json
{ add = 579; bitAnd = 8; bitOr = 14; bitXor = 6; divLeftAssoc = 228; ge_3_3 = 1; ge_3_7 = 1; ge_7_3 = 1; gt_3_3 = 1; gt_3_7 = 1; gt_7_3 = 1; le_3_3 = 1; le_3_7 = 1; le_7_3 = 1; leadingZero = 11; lt_3_3 = 1; lt_3_7 = 1; lt_7_3 = 1; mul = 60; negation = -11; overrideDiv = 4; overrideLessThan = 1; overrideMul = 1; overrideSub = 3; precedence = 20; precedenceEq = 1; precedenceGe = 1; precedenceLt = 1; stringLt = 1; stringLtEqual = 1; stringLtPrefix = 1; subAdd = 11; subLeftAssoc = 5; subParens = 3; sumRange = 1275; }
```

### 2. Impure Evaluation with External Dependencies
Identified that expressions referencing external files (like `lib.nix`) require the `--impure` flag. To test this, the `lib.nix` file was copied to the current directory.
**Command:**
```bash
cp /home/2026-10-16/nix/nix/tests/functional/lang/lib.nix . && nix run /home/2026-10-16/nix/nix -- eval --expr "$(cat /home/2026-10-16/nix/nix/tests/functional/lang/eval-okay-arithmetic.nix)" --impure
```
**Result:**
```json
{ add = 579; bitAnd = 8; bitOr = 14; bitXor = 6; divLeftAssoc = 228; ge_3_3 = 1; ge_3_7 = 1; ge_7_3 = 1; gt_3_3 = 1; gt_3_7 = 1; gt_7_3 = 1; le_3_3 = 1; le_3_7 = 1; le_7_3 = 1; leadingZero = 11; lt_3_3 = 1; lt_3_7 = 1; lt_7_3 = 1; mul = 60; negation = -11; overrideDiv = 4; overrideLessThan = 1; overrideMul = 1; overrideSub = 3; precedence = 20; precedenceEq = 1; precedenceGe = 1; precedenceLt = 1; stringLt = 1; stringLtEqual = 1; stringLtPrefix = 1; subAdd = 11; subLeftAssoc = 5; subParens = 3; sumRange = 1275; }
```

## Methodology for Next Steps
1.  **Identify the AST**: Locate the data structures in `nix-instantiate.cc` that represent the parsed arithmetic expression.
2.  **Follow the Evaluator**: Trace the `add` operation in the source code to see how the engine handles the reduction of the expression.
3.  **Use `tests/functional/`**: Use the existing `.nix` and `.exp` files as a baseline for what "correct" behavior looks like.
