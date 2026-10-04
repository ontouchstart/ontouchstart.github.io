# Stop reading the map. Probe the terrain.
This conversation was generated with Duck.ai (https://duck.ai) using Google's Gemma 4 31B Model. AI chats may display inaccurate or offensive information (see https://duckduckgo.com/duckai/privacy-terms for more info).

====================

User prompt 1 of 8 - 10/4/2026, 1:58:40 PM:
Based on this article https://ontouchstart.github.io/home/2026-10-04/duck.ai_2026-10-04_08-08-31 do some online research on how to make use nix/cargo tools to explore runtime environments instead of following static instructions with bloated context. 

Gemma 4 31B:
To explore runtime environments using Nix and Cargo—rather than relying on static instructions or bloated documentation—you can adopt a **"Double Container"** architecture. This approach treats the system and project dependencies as two distinct, verifiable layers, allowing you to probe the environment empirically.

### The Double Container Architecture
The core idea is to separate dependency management into two hermetic layers to eliminate "it works on my machine" errors:

*   **The Nix Layer (Outer Container):** Defined in a `flake.nix` file, this layer provides the system-level binaries, C-libraries (e.g., `openssl`, `libcurl`, `sqlite`), and the specific Rust toolchain version. It ensures that every developer or agent is working with the exact same system primitives.
*   **The Cargo Layer (Inner Container):** This layer manages the high-level Rust crate graph. It does not attempt to manage system libraries; instead, it relies on the Nix layer to provide the necessary headers and binaries for compilation.

### Workflow for Exploring Runtime Environments
Instead of following a manual, you can use these tools to discover and validate the environment's capabilities:

**1. Analyze and Activate**
Start by examining the `flake.nix` to identify the intended toolchain. Use `nix develop` to enter the environment. This spawns a shell where only the declared dependencies are available, ensuring you are exploring the environment as it will actually behave during a build.

**2. Probe System Linkage**
To verify that the "Double Container" link is functioning, use `pkg-config`. Since Nix provides libraries in a non-standard path, `pkg-config` acts as the bridge that tells Cargo where the Nix-provided C-libraries are located. You can run `pkg-config --libs <library_name>` (e.g., `pkg-config --libs openssl`) to confirm the system library is visible and correctly mapped.

**3. Perform Integration "Canary" Tests**
Rather than assuming the environment is correct, perform a runtime validation:
*   Create a minimal, temporary Rust project.
*   Add a crate that explicitly requires one of the system libraries defined in the Nix flake (e.g., adding the `curl` crate to test for `libcurl`).
*   Run `cargo build`. If the build succeeds, you have empirical proof that the Cargo layer is correctly communicating with the Nix layer.

**4. Implement Ephemeral Workflows**
To avoid "bloated context" (such as massive `target` folders or cached crates polluting the workspace), use a `shellHook` in the `flake.nix`. Redirecting `CARGO_HOME` and `CARGO_TARGET_DIR` to `/tmp` ensures that build artifacts are ephemeral. This forces each exploration session to be clean and prevents persistent state from masking environment issues.

### Tools for Seamless Exploration
*   **`direnv`**: Use this to automatically trigger `nix develop` whenever you `cd` into the project directory, making the transition into the runtime environment invisible.
*   **`fenix`**: For more granular control over the Rust toolchain (e.g., combining specific stable and nightly components), `fenix` can be integrated into the Nix flake to avoid the overhead of `rustup` while maintaining precision.

--------------------

User prompt 2 of 8 - 10/4/2026, 2:01:30 PM:
Inspecting configuration files such as flake.nix or Cargo.toml might not be as effective as running actual nix and cargo commands and reviewing the output. 

Gemma 4 31B:
Moving from static inspection to empirical probing transforms your workflow from guessing based on a configuration file to observing the actual state of the runtime. When you execute commands and analyze their output, you uncover the "ground truth" of how the environment is resolved, which often differs from what is written in the source files due to version overrides, implicit system paths, or shell mutations.

To probe the Nix layer, you should start by entering the environment via `nix develop` and immediately using `which` on your key binaries. This confirms whether you are actually using the toolchain provided by the Nix store or if a global system binary is leaking into your path. Once the binary is confirmed, running `ldd` on that binary is the most effective way to see its actual runtime linkages. In a Nix environment, `ldd` will reveal the specific `/nix/store/` paths for every shared library the binary is loading, allowing you to spot mismatched library versions or missing dependencies that a `flake.nix` file might have omitted.

For the Cargo layer, the most critical tool for empirical exploration is the verbose build flag. Running `cargo build -vv` forces Cargo to print the exact compiler and linker commands it sends to the system. By reviewing this output, you can see the precise `-L` (library path) and `-l` (library name) flags being passed to the linker. This reveals exactly where Cargo is looking for dependencies and whether it is successfully picking up the libraries provided by Nix or failing and falling back to a system default.

To see the final resolved state of your dependencies, use `cargo tree`. While `Cargo.toml` tells you what you requested, `cargo tree` shows you what was actually selected after the resolver handled all the version constraints and feature flags. This is where you discover "dependency bloat" or unexpected version jumps that can cause runtime instability.

The bridge between these two layers is best explored through `pkg-config`. Running `pkg-config --libs <library>` inside your Nix shell tells you exactly what the build system sees. If the output of `pkg-config` matches the linker flags seen in `cargo build -vv`, you have empirical confirmation that the "Double Container" is correctly synchronized. This cycle of command, output, and verification creates a feedback loop that is far more reliable than reading static instructions.

--------------------

User prompt 3 of 8 - 10/4/2026, 2:03:32 PM:
Give a full list of useful nix and cargo programs and options that agent can call. For command to be executed in nix environment, use nix develop —command. 

Gemma 4 31B:
## Nix Environment and Store Exploration
These commands allow an agent to verify the "outer container" of the runtime, ensuring system-level dependencies and toolchains are correctly provisioned.

*   `nix develop --command <cmd>`: Executes a specific command within the context of the `flake.nix` development shell. This is the primary way to ensure the agent is probing the actual environment rather than the host system.
*   `nix print-dev-env`: Outputs the list of all packages, environment variables, and shell hooks that the current flake provides. This is the most direct way to see what the environment is *supposed* to contain.
*   `nix flake check`: Validates that the flake is syntactically correct and that all its outputs (like the dev shell) can be successfully built.
*   `nix store path <package>`: Resolves a package name to its absolute path in the `/nix/store`, which is useful for verifying the exact version of a tool being used.

## Cargo Project and Dependency Probing
These commands analyze the "inner container," revealing how the Rust project is structured and how it resolves its crates.

*   `cargo tree`: Displays the entire dependency graph. Use the `-d` flag to find duplicate versions of the same crate, which often cause runtime linkage errors.
*   `cargo build -vv`: Runs the build process with maximum verbosity. This reveals the exact `rustc` commands and linker flags (like `-L` and `-l`) used to bridge the Cargo layer to the Nix layer.
*   `cargo metadata --format-version 1`: Outputs a detailed JSON representation of the project's workspace and dependency resolution. This is the best way for an agent to programmatically parse the environment's state.
*   `cargo run --release`: Executes the compiled binary in release mode. This is used to verify that optimization flags (which can change runtime behavior) are compatible with the Nix-provided libraries.
*   `cargo pkgid <crate>`: Returns the unique identifier for a specific crate, which is helpful for pinpointing exactly which version of a library is being linked.

## Runtime System Probes
These commands must be wrapped in `nix develop --command` to ensure they are probing the hermetic environment and not the host machine's global state.

*   `nix develop --command which <binary>`: Confirms if the binary is being loaded from the `/nix/store` or a system path like `/usr/bin`.
*   `nix develop --command ldd <binary>`: Lists all shared library dependencies for a binary and reveals exactly which `/nix/store` paths they are resolved to.
*   `nix develop --command pkg-config --libs <library>`: Returns the linker flags for a specific system library. If this output differs from what is seen in `cargo build -vv`, there is a synchronization failure.
*   `nix develop --command env`: Prints all active environment variables. This is critical for checking variables like `LD_LIBRARY_PATH` or `PKG_CONFIG_PATH` that dictate how binaries find libraries.
*   `nix develop --command rustc --version --verbose`: Provides the exact version, commit hash, and host architecture of the Rust compiler provided by the Nix flake.

--------------------

User prompt 4 of 8 - 10/4/2026, 2:14:50 PM:
Write a coherent blog to advocate this approach.

Gemma 4 31B:
# Stop Reading the README: Empirical Environment Exploration with Nix and Cargo

We have all been there: you clone a repository, open the `README.md`, and find a "Getting Started" section that reads like a wish list. It tells you to install specific versions of OpenSSL, a particular build of LLVM, and a handful of system libraries that may or may not be available in your package manager. You spend two hours fighting your OS, only to find that the documentation is six months out of date and the project actually requires a different version of a C-library entirely.

The problem is that we treat runtime environments as **static instructions**. We rely on bloated context—long lists of prerequisites and configuration files—assuming that if the `Cargo.toml` and the documentation agree, the code will run. But configuration files are just intentions; they are not the reality of the runtime.

To break this cycle, we need to move from static inspection to **empirical probing** using a "Double Container" architecture.

## The Double Container Architecture

The most robust way to manage a modern development environment is to separate system-level primitives from project-level dependencies. This creates two distinct, verifiable layers:

**1. The Outer Container (Nix):**
Instead of relying on the host OS, we use Nix to define a hermetic shell. The `flake.nix` file acts as the blueprint for the "room" the code lives in. It provides the exact version of the Rust toolchain and the specific C-libraries (like `sqlite` or `zlib`) required for the project to compile.

**2. The Inner Container (Cargo):**
Inside that Nix shell, Cargo manages the Rust crate graph. It doesn't worry about where `libssl` is located on the disk; it simply assumes that the Outer Container has provided the necessary headers and binaries.

## The Fallacy of Static Inspection

Most developers stop at reading the configuration files. They look at `flake.nix` and think, *"Okay, it says it uses OpenSSL 1.1,"* and they move on.

This is a mistake. Reading a config file is like reading a map of a city that might have been redesigned since the map was printed. The "ground truth" is not in the code; it is in the execution.

Empirical exploration means ignoring the "intent" and probing the "result." Instead of trusting that the environment is correct because the file says so, you use the tools of the trade to force the environment to reveal its actual state.

## Probing the Ground Truth

When you stop following instructions and start probing the system, your workflow shifts to a series of targeted commands.

### Step 1: Verify the Outer Container
Don't just enter the shell; verify that the shell is actually controlling your environment. Use `nix develop --command which <binary>` to ensure you are using the version in the `/nix/store` and not a leaked global binary from `/usr/bin`. If you want to see the actual linkage of a binary, `ldd` is your best friend. Running `ldd` on a compiled binary reveals the exact paths to the shared libraries being loaded—if you see a path outside of the Nix store, you have a leak.

### Step 2: Probe the Inner Container
Once the system layer is verified, look at the resolved dependency graph. `Cargo.toml` shows you what you *asked* for, but `cargo tree` shows you what you *got*. This is where you find version conflicts and dependency bloat that static files hide.

To see how the two containers are communicating, run `cargo build -vv`. The double-verbosity flag is the "X-ray" of the Rust build process. It prints the exact linker flags (`-L` and `-l`) being passed to the compiler. If the linker is looking for a library in a directory that doesn't exist, the `Cargo.toml` doesn't matter—the build will fail.

### Step 3: Test the Bridge
The bridge between Nix and Cargo is usually `pkg-config`. By running `nix develop --command pkg-config --libs <library>`, you can see exactly what the build system sees. When the output of `pkg-config` matches the flags in `cargo build -vv`, you have empirical proof that your "Double Container" is synchronized.

## From Instructions to Evidence

The shift from "following instructions" to "probing environments" is a shift from faith to evidence. 

By using Nix and Cargo not just as build tools, but as diagnostic instruments, we eliminate the need for bloated setup guides. We no longer care what the README says the environment should be; we know exactly what the environment *is* because we have probed it.

Stop reading the map. Start exploring the terrain.

--------------------

User prompt 5 of 8 - 10/4/2026, 2:18:03 PM:
In the tone of an enterprise consultancy.

Gemma 4 31B:
# Mitigating Documentation Drift: A Stratified Approach to Runtime Environment Validation

In the modern enterprise software lifecycle, one of the most persistent drains on engineering velocity is the "onboarding gap"—the delta between a project's documented setup instructions and the actual operational requirements of the runtime environment. When developers rely on static READMEs and configuration files to establish their local environments, they are not interacting with the system; they are interacting with a historical record of how the system *once* functioned.

This reliance on static context creates significant operational risk, manifesting as "documentation drift," where implicit system dependencies evolve while the instructions remain stagnant. The result is an increase in engineering toil, prolonged time-to-contribution for new hires, and the frequent occurrence of the "it works on my machine" phenomenon.

To solve this, we propose a transition from static environment configuration to an **Evidence-Based Validation Framework**, powered by a Stratified Environment Architecture.

## The Stratified Environment Architecture

To eliminate ambiguity, organizations should decouple system-level primitives from application-level dependencies. We define this as a two-tier containment strategy:

**1. The Infrastructure Layer (Nix):**
The infrastructure layer utilizes Nix to provide a hermetic, reproducible shell. Rather than assuming the presence of specific C-libraries or toolchains on a host OS, the environment is defined as code via `flake.nix`. This ensures that every engineer, regardless of their underlying operating system, is operating within an identical system primitive.

**2. The Application Layer (Cargo):**
Within this hermetic shell, the application layer (managed by Cargo) handles the high-level dependency graph. By isolating the application layer from the host OS, we ensure that the Rust crate graph interacts only with the verified primitives provided by the infrastructure layer.

## Moving from Static Inspection to Empirical Validation

The core failure of traditional environment management is the assumption that inspecting a configuration file is equivalent to verifying a runtime. A `Cargo.toml` or `flake.nix` represents *intent*, not *reality*. 

An enterprise-grade workflow must replace static inspection with **Empirical Probing**. This methodology requires agents and engineers to treat the environment as a black box that must be queried for evidence of its current state.

### The Validation Protocol

To ensure operational alignment, we recommend the following verification sequence:

*   **Primitive Verification:** Instead of assuming the correct toolchain is active, execute `nix develop --command which <binary>`. This provides empirical proof that the environment is sourcing binaries from the immutable Nix store rather than leaking inconsistent global binaries from the host system.
*   **Linkage Analysis:** To mitigate runtime failures in production, use `ldd` within the Nix context to audit shared library dependencies. This reveals the actual resolution paths of binaries, ensuring no unauthorized or outdated system libraries are being linked.
*   **Resolution Auditing:** Move beyond the `Cargo.toml` by utilizing `cargo tree`. This allows the organization to identify version duplication and dependency bloat—hidden risks that often lead to instability and increased binary size.
*   **Linker Transparency:** Use `cargo build -vv` to extract the exact linker flags being passed to the compiler. By comparing these flags against the output of `pkg-config` within the Nix shell, engineers can verify the synchronization between the Infrastructure Layer and the Application Layer.

## Business Value and ROI

Implementing a Stratified Environment Architecture delivers three primary business outcomes:

1.  **Reduction in Engineering Toil:** By replacing manual setup guides with a single `nix develop` entry point, the time from "repository clone" to "first successful build" is reduced from hours to seconds.
2.  **Enhanced CI/CD Reliability:** When the local development environment is an exact mirror of the build agent, the risk of "deployment surprises" is virtually eliminated.
3.  **Mitigation of Technical Debt:** Moving to an evidence-based probing model allows teams to identify and prune unused dependencies and outdated toolchains through actual runtime data, rather than guessing based on outdated documentation.

In conclusion, the goal is to stop managing environments through instructions and start managing them through evidence. By adopting this stratified approach, enterprises can ensure that their development velocity is limited by their creativity, not by their configuration.

--------------------

User prompt 6 of 8 - 10/4/2026, 2:19:29 PM:
In the tone of AI engineering experts.

Gemma 4 31B:
# Eliminating Context Pollution: Empirical Runtime Grounding for Agentic Workflows

In the current landscape of AI-assisted engineering, we are seeing a recurring failure mode in agentic loops: **the documentation-reality gap**. When an agent is tasked with building or debugging a project, the standard approach is to feed the agent the `README.md` and configuration files. This creates "bloated context"—thousands of tokens of static instructions that may be outdated, contradictory, or subtly incorrect.

When an agent follows an outdated instruction, it enters a failure loop: it executes a command $\rightarrow$ receives an error $\rightarrow$ attempts to "hallucinate" a fix based on the provided static context $\rightarrow$ fails again. The agent is trying to resolve a runtime problem using a map that no longer matches the terrain.

To solve this, we need to move away from prompt-based instructions and toward **Empirical Runtime Grounding**.

## The Architecture: Stratified Hermeticity

The goal is to provide the agent with a runtime that is not only reproducible but queryable. We achieve this through a stratified architecture that separates system primitives from application dependencies.

**The System Layer (Nix):**
We treat the OS as a variable that must be neutralized. By using Nix flakes, we provide a hermetic environment. This isn't just about reproducibility for humans; it's about providing the agent with a deterministic boundary. When the agent executes `nix develop`, it is stepping into a controlled sandbox where the toolchain and C-libraries are immutable and explicit.

**The Dependency Layer (Cargo):**
Inside the Nix shell, Cargo manages the Rust crate graph. Because the system layer is hermetic, Cargo can operate with a higher degree of reliability, knowing that the underlying `libssl` or `libc` won't suddenly shift between different developer machines or CI runners.

## Moving from "Reading" to "Probing"

The core thesis for AI engineering is this: **An agent should never trust a README if it can query the runtime.**

Instead of instructing an agent to "Follow the setup steps in the README," we enable the agent to use a set of probing primitives to discover the ground truth. This reduces token waste and prevents the agent from drifting into hallucinated solutions.

### The Agentic Probing Loop

We replace static context with a dynamic discovery loop:

1.  **Binary Verification:** Rather than assuming the path is correct, the agent calls `nix develop --command which <binary>`. This provides immediate, empirical evidence of whether the toolchain is correctly sourced from the `/nix/store`.
2.  **Linkage Auditing:** To debug "missing library" errors, the agent doesn't guess which package to install. It runs `nix develop --command ldd <binary>`. This reveals the exact shared library resolution path, allowing the agent to pinpoint the missing dependency with surgical precision.
3.  **Graph Resolution:** To handle dependency conflicts, the agent ignores the `Cargo.toml` (which is just intent) and calls `cargo tree`. This gives the agent the actual resolved graph, revealing duplicate versions or feature-flag mismatches that a human might overlook.
4.  **Linker X-Ray:** When the build fails, the agent utilizes `cargo build -vv`. By analyzing the raw `rustc` calls and linker flags, the agent can see exactly where the Cargo layer is attempting to interface with the Nix layer, turning a vague "linker error" into a concrete pathing problem.

## Impact on Agentic Reliability

By shifting to this model, we achieve three critical improvements in AI engineering:

*   **Reduced Context Noise:** We can strip massive "Installation" sections from the prompt. The agent doesn't need to be told how to set up the environment; it is given the tools to validate and fix the environment itself.
*   **Faster Convergence:** Agents stop guessing. When the feedback loop is based on `ldd` and `cargo tree` output rather than README text, the agent converges on a working build in significantly fewer iterations.
*   **Higher Fidelity Ground Truth:** We move the "source of truth" from a markdown file (which is prone to drift) to the Nix store and the Cargo lockfile (which are mathematically deterministic).

In short: stop feeding your agents instructions. Give them a hermetic environment and the primitives to probe it. The path to reliable AI engineering isn't better prompting—it's better grounding.

--------------------

User prompt 7 of 8 - 10/4/2026, 2:20:25 PM:
In the tone of a computer scientist.

Gemma 4 31B:
# On the Formalization of Runtime Environments: Replacing Declarative Intent with Operational Evidence

In the study of software systems, we frequently encounter the problem of **leaky abstractions**, where the conceptual model of a system fails to encapsulate the underlying physical or operational reality. Perhaps the most pervasive example of this in modern engineering is the "Environment Specification"—the collection of READMEs, setup scripts, and configuration files used to synchronize a development environment across different machines.

The fundamental failure of this approach is the reliance on **declarative intent**. A `Cargo.toml` or a documentation file describes a *desired* state, but it does not provide a guarantee of the *actual* state. When the operational state of the system drifts from the declared intent—due to implicit system dependencies, version overrides, or ambient environment variables—we encounter non-deterministic failures.

To resolve this, we can apply a stratified architecture that treats the runtime environment as a verifiable system rather than a set of instructions.

## The Stratified Hermetic Model

To achieve determinism, we must isolate the system's state space. I propose a "Double Container" model that separates the environment into two distinct layers of abstraction:

**1. The Infrastructure Layer (The Nix Store):**
The goal here is to achieve **hermeticity**. By utilizing Nix, we move from a global, mutable system state (e.g., `/usr/lib`) to an immutable, content-addressed store. In this model, the `flake.nix` is not a set of instructions to be followed, but a functional definition of the environment. The resulting environment is idempotent: regardless of the host OS, the input (the flake) always produces the same output (the shell).

**2. The Application Layer (The Cargo Graph):**
Within this hermetic shell, we overlay the Cargo dependency graph. While Cargo handles the high-level logic of the Rust crate ecosystem, it remains dependent on the underlying system primitives. By nesting Cargo within a Nix shell, we ensure that the application layer interacts with a constant, rather than a variable, infrastructure.

## Empirical Probing vs. Static Analysis

Most developers approach environment troubleshooting as a form of static analysis: they read the configuration files and attempt to infer the state of the system. From a computer science perspective, this is an inefficient way to resolve state. If the goal is to understand the current runtime, the only reliable method is **empirical probing**—querying the system to extract its operational ground truth.

We can define a protocol for extracting this state through a series of targeted probes:

*   **Path Verification:** By executing `which <binary>` within the Nix context, we verify the resolution of the search path. This confirms that the system is utilizing the immutable store rather than falling back to an ambient system binary.
*   **Linkage Analysis:** The `ldd` utility allows us to perform a runtime audit of shared library dependencies. By analyzing the resolved paths of a binary, we can detect "leakage"—instances where the binary is linked against libraries outside the hermetic store, thereby breaking the reproducibility of the system.
*   **Dependency Graph Resolution:** While `Cargo.toml` expresses the constraints, `cargo tree` reveals the actual resolved state of the dependency graph. This is the only way to detect version duplication or unexpected feature-set mutations that occur during the resolution process.
*   **Linker Transparency:** By invoking `cargo build -vv`, we can intercept the exact commands sent to the compiler. This allows us to observe the bridge between the two layers, specifically how the linker flags (`-L`, `-l`) map the Application Layer to the Infrastructure Layer.

## Conclusion: Toward Operational Grounding

The shift from "following instructions" to "probing state" is a shift from heuristic-based debugging to evidence-based verification. 

By implementing a stratified architecture and utilizing empirical probes, we eliminate the noise associated with "bloated context." We no longer need to maintain extensive documentation because the environment is self-documenting through its operational state. In essence, we move the source of truth from a mutable human-readable document to a mathematically deterministic store, ensuring that the runtime is not a variable to be managed, but a constant to be leveraged.

--------------------

User prompt 8 of 8 - 10/4/2026, 2:21:21 PM:
In the tone of a principal engineer.

Gemma 4 31B:
# Stop Trusting the README: Why We’re Moving to Empirical Runtime Probing

If you’ve been in this industry long enough, you know the "Onboarding Tax." It’s those first two days you spend with a new repo, following a README that was written by a dev who left the company six months ago. You install the dependencies, you tweak your `PATH`, you fight with a version of `openssl` that’s just slightly too new for the project, and you spend four hours debugging a linker error that turns out to be a ghost in your machine.

The root cause isn't that the documentation is bad—it's that we're treating the runtime environment as a **static set of instructions**. We assume that if we follow the steps and the `Cargo.toml` looks right, the environment *should* be correct.

But as a Principal, my rule is simple: **Intent is not reality.** 

A `Cargo.toml` or a `flake.nix` describes what we *want* the system to look like. It is a declaration of intent. But the actual runtime—the binaries in your path, the shared libraries in memory, the resolved dependency graph—is the only thing that actually matters. When there is a gap between intent and reality, you get "it works on my machine" bugs, and those are the most expensive bugs we have.

## The Strategy: The Double Container

To kill this class of bugs, we are adopting a "Double Container" architecture. We aren't talking about Docker here; we're talking about logical layers of isolation.

**Layer 1: The Infrastructure (Nix)**
We use Nix to handle the "ugly" stuff—the C-libraries, the system headers, the specific toolchain version. By defining this in a `flake.nix`, we stop relying on the host OS. We aren't asking the dev to "install libcurl"; we're providing a hermetic shell where `libcurl` is guaranteed to be exactly the version we need.

**Layer 2: The Application (Cargo)**
Inside that Nix shell, Cargo does what it does best: managing the Rust crate graph. Because the underlying system is now a constant (thanks to Nix), Cargo is no longer fighting a moving target.

## Stop Reading, Start Probing

Here is where most teams get it wrong: they think that once the `flake.nix` is written, the problem is solved. They go back to reading the config files to debug issues.

**Stop doing that.** 

If you are debugging a runtime issue, reading a config file is just guessing. You need to move to **empirical probing**. You need to query the system for evidence.

When I'm reviewing a build failure or onboarding a new engineer, I don't want to hear "The flake says we're using X." I want to see the output of the probes.

### The Probing Protocol

If you're stuck, stop looking at the code and run these four checks:

1.  **The Path Check:** Run `nix develop --command which <binary>`. 
    *   *The goal:* Confirm you aren't accidentally using a global binary from `/usr/bin`. If it's not coming from `/nix/store`, your environment is leaking.
2.  **The Linkage Audit:** Run `nix develop --command ldd <binary>`.
    *   *The goal:* See exactly which `.so` files are being loaded. This is the only way to find out if you're linking against a system library instead of the Nix-provided one.
3.  **The Resolution Check:** Run `cargo tree`.
    *   *The goal:* `Cargo.toml` is intent; `cargo tree` is reality. Look for duplicate versions of the same crate. That’s usually where your "trait not implemented" or "type mismatch" bugs are hiding.
4.  **The Linker X-Ray:** Run `cargo build -vv`.
    *   *The goal:* I want to see the raw `rustc` calls. Look at the `-L` and `-l` flags. If the linker is looking in the wrong directory, the `Cargo.toml` is irrelevant. The `-vv` output is the ground truth.

## The Bottom Line: Velocity

This isn't about being "pure" or using the coolest tools. It's about **engineering velocity**.

Every hour a senior dev spends helping a junior fix their local environment is a waste of high-value talent. Every CI failure that can't be reproduced locally is a tax on our release cycle.

By moving to a stratified architecture and a culture of empirical probing, we eliminate the "Onboarding Tax." We stop guessing, we stop trusting outdated READMEs, and we start relying on evidence. 

Stop reading the map. Probe the terrain.
