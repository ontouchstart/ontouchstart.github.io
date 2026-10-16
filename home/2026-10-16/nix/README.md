# Learning Nix for Experienced Programmers (Source-Code Approach)

As an experienced programmer with access to the Nix source code, you have a unique advantage: you can learn Nix by understanding its architecture rather than just memorizing its commands. This roadmap is designed to bridge the gap between the **Nix Engine** (the software you have the source for) and the **Nix Language** (the DSL you will use).

## 1. Distinguish the Engine from the Language
Before diving in, understand the two layers of Nix:
*   **The Engine (Source Code):** The implementation (C/Rust/etc.) that handles file locking, the Nix store, networking, parsing, and evaluation.
*   **The Language (Nix Expressions):** The declarative DSL used to define build instructions, configurations, and environments.

## 2. The Architecture Walkthrough
Instead of reading documentation, explore the project structure. Identify these core components in the source:

*   **`nix-expr`**: Locate the evaluation engine. Study how expressions are parsed into Abstract Syntax Trees (ASTs) and how they are reduced to values.
*   **The Store**: Find the logic for the `/nix/store`. Analyze how it handles atomicity and how it implements content-addressable storage.
*   **Derivations**: This is the fundamental unit of Nix. Find the data structures that represent a "build instruction." A derivation is essentially a pure function: `Inputs -> Outputs`.
*   **Fetchers**: Examine how Nix handles remote dependencies. This reveals how Nix maintains reproducibility by verifying external data.

## 3. Trace-Driven Learning
The fastest way for a developer to learn a new system is to trace a single execution path.

**Exercise:** Run `nix build --eval -E '(import <nixpkgs> {}).hello'` and trace it:
1.  Find the entry point of the `nix build` command in the source.
2.  Follow the code as it calls the **parser** to turn the string into an AST.
3.  Follow the **evaluator** as it resolves `<nixpkgs>` (this will lead you to Flake/Channel logic).
4.  Observe how it produces a **Store Path** as the final result.

## 4. Study the "Standard Library" (nixpkgs)
Once you understand the engine, you need to learn the "idioms" of the language.
*   **Analyze `nixpkgs`**: This is the de facto standard library. By reading how common packages (like `python`, `gcc`, or `nodejs`) are defined, you will learn the standard patterns for handling dependencies, build flags, and environment isolation.

## 5. "Read-Modify-Run" Mastery
Use your access to the source to solidify your mental model:
*   **Inject Logging**: Add print statements or loggers to the evaluation engine to see what happens during a build.
*   **Small Hacks**: Modify a small behavior in the tool, recompile it, and run it. 
*   **Debug**: When you encounter a confusing Nix error, look for the corresponding error handling in the source code to see exactly what part of the evaluation failed.

## Summary Roadmap
1.  **Scan** the project tree for Parser, Evaluator, and Store modules.
2.  **Write** a simple `.nix` file and run `nix build`.
3.  **Trace** that specific execution through the source code.
4.  **Read** `nixpkgs` to learn the "best practices" of the DSL.
5.  **Debug** the tool itself to understand the internal mechanics.
