# bun-revew

The objective is to _explore_ and _review_ code base of the [bun project](https://github.com/oven-sh/bun) via interactive or automated processes in a nixos/nix docker environment. 

Deterministic log files are committed to the git repo for interactive and automated analysis.

See root level [Makefile](Makefile), [Dockerfile](Dockerfile) and [compose.yml](compose.yml).

To start from scractch
```
make clean dev-test.log
```
