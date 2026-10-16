# Introduction to Nix

Nix is a purely functional package manager and build system. It allows you to build software in a way that is reproducible, isolated, and deterministic.

## Core Concepts

### 1. The Nix Store
Every package in Nix is installed in a read-only directory in the `/nix/store`. Each directory has a unique hash based on the inputs (source code, dependencies, build scripts). This ensures that different versions of the same software can coexist without conflict.

### 2. Derivations
A **derivation** is a set of instructions for building a package. It is a pure function:
`Source + Build Instructions + Dependencies = Output`
Because it is pure, Nix can cache the output. If you build the same derivation twice, Nix will simply point to the existing result in the store.

### 3. Flakes
**Flakes** are the modern way to manage Nix projects. They use a `flake.nix` file to define:
- **Inputs**: External dependencies (like the Nixpkgs repository).
- **Outputs**: The packages and development environments the project provides.
- **Lock files**: A `flake.lock` file ensures that everyone on a team uses the exact same versions of inputs.

---

## Hands-on with the Nix Project

In this directory, we are looking at the source code of Nix itself. You have already experimented with several powerful commands.

### 1. Running a Command (`nix run`)
The `nix run` command looks at the flake and executes a specific output.
```bash
nix run . -- --version
```
- `.` tells Nix to look at the current directory's flake.
- `--` separates Nix arguments from the arguments passed to the actual program.
- `--version` is the argument passed to the `nix` executable.

### 2. Entering a Development Shell (`nix develop`)
`nix develop` enters a shell where all the development dependencies (compilers, libraries, tools) are automatically set up.
```bash
nix develop . --command bash -c 'cd nix && nix run . -- version'
```
Inside the `nix develop` shell, Nix automatically manages your `PATH`, `LD_LIBRARY_PATH`, and other environment variables.

### 3. Exploring the Flake (`nix flake show`)
To see what a project provides, use `flake show`.
```bash
nix run . -- flake show
```
If you want to see everything including hidden or cross-compilation targets:
```bash
nix run . -- flake show --all-systems
```
This output tells you exactly what "atoms" are available for you to use.

---

## A Simple Example

To understand how a project is structured, here is a minimal `flake.nix` that provides a simple "Hello World" program.

### `flake.nix`
```nix
{
  description = "A simple hello world flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    # This defines what happens when you run 'nix run'
    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.hello;
    
    # This defines what happens when you run 'nix develop'
    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.hello.shell;
  };
}
```

### How to build a custom package?
If you wanted to create your own derivation, you would define a set of attributes:

```nix
{
  name = "my-app";
  src = ./.;
  buildInputs = [ nixpkgs.lib.optional lib.mkOption { name = "use-gcc"; type = lib.types.bool; default = true; } ];
  buildPhase = "gcc main.c -o my-app";
}
```

## Summary of Useful Commands
| Command | Purpose |
| --- | --- |
| `nix flake show` | List all available outputs |
| `nix run .` | Run the default output |
| `nix develop` | Enter a development shell |
| `nix build .` | Build the default output without running it |
| `nix shell <package>` | Quickly enter a shell with one tool |
