all:/tmp/bun/build/debug/bun-debug;/tmp/bun/build/debug/bun-debug --version
/tmp/bun/build/debug/bun-debug:/tmp/bun;cd /tmp/bun && nix develop --command bash -c "bun scripts/build.ts --profile=debug --asan=off"
/tmp/bun:;cp flake.nix /tmp&&cd /tmp && git clone --depth=1 https://github.com/oven-sh/bun.git&&cp flake.nix bun&&cd /tmp/bun &&nix flake update
