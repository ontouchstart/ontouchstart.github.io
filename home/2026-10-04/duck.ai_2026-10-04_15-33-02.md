# SKILL: Inspecting Immutable NixOS Environment Source
This conversation was generated with Duck.ai (https://duck.ai) using Google's Gemma 4 31B Model. AI chats may display inaccurate or offensive information (see https://duckduckgo.com/duckai/privacy-terms for more info).

====================

User prompt 1 of 4 - 10/4/2026, 3:27:18 PM:
In NixOS environment, can we review the source code of nix itself)

Gemma 4 31B:
Yes, you can review the source code of Nix. Because Nix and NixOS are open-source projects, the source code for the Nix package manager itself is publicly available and can be accessed directly from within your NixOS environment.

To review the source code locally, you can follow these steps:

1. Install git if it is not already in your environment by adding it to your configuration or running `nix-shell -p git`.
2. Clone the official Nix repository from GitHub using the command `git clone https://github.com/NixOS/nix.git`.
3. Navigate into the cloned directory to explore the C++ and Rust source files that make up the core of the package manager.

If you are looking for the definitions of the packages and the system configuration rather than the core tool's logic, you are likely looking for nixpkgs. You can access the source of the NixOS expressions by cloning `https://github.com/NixOS/nixpkgs.git` or by browsing the local copy of the channel on your system, typically found in `/nix/var/nix/profiles/per-user/root/channels/nixos-unstable` (the path may vary depending on your specific channel and installation).

For a deeper dive, you can use a Nix shell to enter a development environment that contains all the dependencies required to build Nix from source. This allows you to not only read the code but also compile it and run tests to see how specific changes affect the system.

--------------------

User prompt 2 of 4 - 10/4/2026, 3:28:16 PM:
Can we use nix instead of git?

Gemma 4 31B:
Yes, you can use Nix to obtain the source code, though it functions differently than git. While git clones a full repository with its entire commit history and allows you to make changes, Nix fetches a specific version of the source as a read-only snapshot and stores it in the Nix store.

To get the source code of Nix using the Nix command line, you can build the source derivation. Depending on whether you use Flakes or traditional channels, you can use one of the following commands:

If you use Flakes:
`nix-build '<nixpkgs>' -A nix.src`

If you use channels:
`nix-build /nix/var/nix/profiles/per-user/root/channels/nixos-unstable/pkgs/nix.src`

When you run this, Nix will download the source code, unpack it, and return a path starting with `/nix/store/...`. You can then navigate to that path to review the code.

Using Nix this way is often faster than using git because it only downloads the specific snapshot needed for the current version of the software rather than the entire historical archive of the project. However, since the files are located in the Nix store, they are immutable; you cannot edit them directly. If you intend to modify the code or contribute back to the project, git remains the necessary tool.

--------------------

User prompt 3 of 4 - 10/4/2026, 3:30:42 PM:
That is perfect. We need immutable source code of the current nix environment so that agent can inspect it for accurate and updated information. 

Gemma 4 31B:
Using the Nix store for this purpose is an ideal approach because it provides a cryptographically hashed, immutable snapshot. This ensures that the agent is inspecting the exact version of the code that corresponds to the running system, preventing "version drift" where the agent might suggest a feature or a fix that doesn't exist in the current installation.

If the agent needs to understand the environment's package definitions and system logic rather than the internal C++/Rust code of the Nix tool itself, you should provide the source for nixpkgs. You can resolve the immutable path to the current nixpkgs source using this command:

`nix-instantiate --eval -E 'with import <nixpkgs> {}; nixpkgs.src'`

This will output a path like `/nix/store/[hash]-nixpkgs-[version]`. By pointing your agent to this directory, it can browse the entire collection of expressions used to build the current environment.

If the agent also needs to see how your specific system is configured (the actual "environment" settings), you should also provide the contents of your configuration files, typically found in `/etc/nixos/` or your flake directory. While the nixpkgs source tells the agent what is *possible* and how packages are defined, your configuration files tell the agent what is actually *active* on your machine. Together, these two sources provide a complete and immutable reference for the agent to analyze.

--------------------

User prompt 4 of 4 - 10/4/2026, 3:31:58 PM:
Make this into a full instruction SKILL.md

Gemma 4 31B:
# SKILL: Inspecting Immutable NixOS Environment Source

This skill enables an AI agent to retrieve and inspect the exact, immutable source code of the Nix package manager and the Nixpkgs collection currently active in the environment. This ensures that all technical analysis is based on the actual version deployed on the system, eliminating version drift and hallucinations regarding available features or API signatures.

## Objective
Provide the agent with a cryptographically hashed, read-only snapshot of the system's underlying logic to ensure 100% accuracy when diagnosing issues or suggesting configuration changes.

---

## 1. Retrieve Core Nix Source (Tool Logic)
To inspect the C++ and Rust code of the Nix package manager itself, use the source derivation.

**Command:**
```bash
nix-build '<nixpkgs>' -A nix.src
```

**Expected Outcome:**
The command returns a path such as `/nix/store/[hash]-nix-[version]`.
- **Use Case:** Use this path when you need to understand how the Nix tool handles builds, garbage collection, or store management internally.

---

## 2. Retrieve Nixpkgs Source (Package Definitions)
To inspect the expressions and definitions of all packages available in the current channel, resolve the `nixpkgs.src` attribute.

**Command:**
```bash
nix-instantiate --eval -E 'with import <nixpkgs> {}; nixpkgs.src'
```

**Expected Outcome:**
The command returns a path such as `/nix/store/[hash]-nixpkgs-[version]`.
- **Use Case:** Use this path to verify how a specific package is defined, check its dependencies, or review the patches applied to a piece of software in the current environment.

---

## 3. Retrieve Local System Configuration
The store paths provide the *available* logic, but the local configuration defines the *active* environment.

**Primary Paths:**
- Standard installation: `/etc/nixos/configuration.nix`
- Flake-based installation: The directory containing `flake.nix` and `flake.lock`.

**Integration Strategy:**
1. Check for the existence of `flake.nix` in the home directory or `/etc/nixos/`.
2. If found, prioritize the Flake lock file to determine the exact commit of nixpkgs being used.
3. Read `configuration.nix` to map the active modules and options.

---

## Agent Workflow for Context Injection

When tasked with a deep-dive technical query about the NixOS environment, the agent should follow this sequence:

1. **Identify Version:** Run the `nix-instantiate` command to find the immutable nixpkgs path.
2. **Map Configuration:** Read the local `/etc/nixos/` files to see which options are enabled.
3. **Cross-Reference:** If the behavior of a package is unexpected, navigate to the immutable store path retrieved in Step 1 and inspect the specific `.nix` expression for that package.
4. **Verify Tooling:** If the issue relates to the package manager's behavior (e.g., a bug in `nix-collect-garbage`), retrieve the core Nix source via `nix-build`.

## Summary Table for Agent Reference

| Target | Command / Path | Content Type | Property |
| :--- | :--- | :--- | :--- |
| **Nix Tool** | `nix-build '<nixpkgs>' -A nix.src` | C++, Rust | Immutable Store Path |
| **Nixpkgs** | `nix-instantiate --eval -E 'with import <nixpkgs> {}; nixpkgs.src'` | Nix Expressions | Immutable Store Path |
| **System Config**| `/etc/nixos/` or `flake.nix` | Nix Configuration | Mutable Local Path |
