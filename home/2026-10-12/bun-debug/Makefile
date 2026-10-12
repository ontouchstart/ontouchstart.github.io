all:/tmp/bun/build/debug/bun-debug;/tmp/bun/build/debug/bun-debug --version
/tmp/bun/build/debug/bun-debug:/tmp/bun;cd /tmp/bun && nix develop --command bash -c "bun scripts/build.ts --profile=debug --asan=off"
/tmp/bun:;cp flake.patch /tmp&& cd /tmp && git clone -b bun-v1.4.2 https://github.com/oven-sh/bun.git && cd /tmp/bun && git apply ../flake.patch && nix flake update
