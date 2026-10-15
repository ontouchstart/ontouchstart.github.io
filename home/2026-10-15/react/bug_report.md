# Bug Report

## Bug 1: Permission Denied (EACCES) for esbuild
- **Environment**: `/workspace`
- **Command**: `nix develop --command bash -c 'cd react && yarn install'`
- **Error**: `Error: spawnSync /workspace/react/node_modules/@esbuild/linux-arm64/bin/esbuild EACCES`
- **Root Cause**: The `/workspace` partition is mounted with the `noexec` flag. This prevents the execution of any binaries within that directory, including the `esbuild` binary downloaded and managed by `yarn`.

## Bug 2: Architecture Mismatch for optipng-bin
- **Environment**: `/tmp/workspace` (moved from `/workspace` to bypass `noexec`)
- **Command**: `nix develop --command bash -c 'cd react && yarn install'`
- **Error**: `qemu-x86_64: Could not open '/lib64/ld-linux-x86-64.so.2': No such file or directory`
- **Root Cause**: 
    - The host architecture is `aarch64` (ARM64).
    - The `optipng-bin` package provides a pre-compiled `x86_64` binary.
    - The system attempts to run this binary using `qemu-x86_64` emulation.
    - The emulation fails because the environment lacks the necessary `x86_64` dynamic linker (`/lib64/ld-linux-x86-64.so.2`) required by the emulator to execute the `x86_64` binary.
