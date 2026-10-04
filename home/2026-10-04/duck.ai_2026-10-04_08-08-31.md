# Agent Environment Guide: Nix-Cargo Double Container
This conversation was generated with Duck.ai (https://duck.ai) using Google's Gemma 4 31B Model. AI chats may display inaccurate or offensive information (see https://duckduckgo.com/duckai/privacy-terms for more info).

====================

User prompt 1 of 2 - 10/4/2026, 8:04:32 AM:
Review https://ontouchstart.github.io/home/2026-10-04/2026-10-04T11-10-46-170Z_01a1069b-f39a-7741-b247-2d02f75c706e

Gemma 4 31B:
This document logs a successful session where an AI agent explores and validates a "double container" development environment combining **Nix** and **Cargo**.

### Technical Review
The agent's methodology was systematic and rigorous:
*   **Environment Analysis:** It first analyzed the `flake.nix` to identify the available toolchain (Rust, Cargo) and system dependencies (`libcurl`, `openssl`, `sqlite`, `pkg-config`).
*   **Validation Strategy:** Rather than simply assuming the environment worked, the agent performed a critical "integration test." By adding the `curl` crate to a new Rust project, it forced Cargo to link against the system `libcurl` provided by Nix. The successful build proved that the `pkg-config` and system library layers were correctly integrated.
*   **Workspace Management:** The agent correctly identified the importance of the `shellHook` in `flake.nix`, which redirects `CARGO_HOME` and `CARGO_TARGET_DIR` to `/tmp` to prevent persistent storage pollution—a key requirement for ephemeral agentic workflows.

### Summary of the "Double Container" Concept
The session concludes that this architecture is ideal for agentic coding by splitting dependency management into two distinct layers:
1.  **The Nix Layer (System):** Acts as the "outer container," providing a hermetic and reproducible set of system-level binaries and C-libraries. This eliminates the "it works on my machine" problem for system dependencies.
2.  **The Cargo Layer (Project):** Acts as the "inner container," managing the high-level Rust crate dependency graph and project-specific compilation.

### Conclusion
The agent performed the task flawlessly, demonstrating a strong understanding of how to verify complex environment interdependencies. The resulting summary accurately highlights the benefits of **hermeticity**, **reproducibility**, and **ephemeral builds** for autonomous coding agents.

Read More
- https://ontouchstart.github.io/home/2026-10-04/2026-10-04T11-10-46-170Z_01a1069b-f39a-7741-b247-2d02f75c706e

--------------------

User prompt 2 of 2 - 10/4/2026, 8:07:42 AM:
Make an AGENT.md from this framework.

Gemma 4 31B:
# Agent Environment Guide: Nix-Cargo Double Container

This document provides the operational framework for AI agents working within this repository. This project utilizes a "double container" architecture to ensure hermeticity and reproducibility across different execution environments.

## Architecture Overview

The development environment is split into two distinct layers of dependency management:

1.  **System Layer (Nix):** The outer container. Defined in `flake.nix`, this layer provides a reproducible set of system binaries, C-libraries, and the Rust toolchain. It ensures that all system-level dependencies are identical regardless of the host OS.
2.  **Project Layer (Cargo):** The inner container. This layer manages Rust-specific crates and project dependencies. It relies on the system layer to provide the necessary headers and libraries for compilation.

## Toolchain and Dependencies

### System Dependencies
The following system libraries are provided by the Nix environment and are available for linking via `pkg-config`:
*   `libcurl`
*   `openssl`
*   `sqlite`
*   `pkg-config`

### Rust Toolchain
The Rust compiler (`rustc`) and package manager (`cargo`) are managed by Nix to ensure version consistency.

## Operational Guidelines

### Environment Activation
Always ensure the Nix environment is active before attempting to build or run code. If the environment is not active, `cargo` may fail to locate system libraries or use an incorrect toolchain version.

### Ephemeral Storage and Build Artifacts
To maintain a clean workspace and support ephemeral agentic workflows, the `shellHook` in `flake.nix` redirects the following directories to `/tmp`:
*   `CARGO_HOME`
*   `CARGO_TARGET_DIR`

**Warning:** Do not attempt to persist build artifacts or cached crates within the project directory. Any data stored in `/tmp` will be lost upon session termination.

### Handling System-Level Dependencies
When adding a Rust crate that requires a system library (e.g., `curl`, `openssl`), follow these steps to ensure the "double container" link is functioning:
1.  Identify the required system library.
2.  Verify the library exists in the `flake.nix` dependencies.
3.  Add the corresponding crate to `Cargo.toml`.
4.  Run a test build to verify that `pkg-config` successfully links the Rust crate to the Nix-provided library.

## Validation Procedure

To verify the integrity of the environment, perform the following integration test:
1.  Create a minimal Rust project.
2.  Add a crate that depends on a system library (e.g., `curl`).
3.  Execute `cargo build`.
4.  Confirm that the build completes without "library not found" errors, proving the Cargo layer is correctly communicating with the Nix layer.
