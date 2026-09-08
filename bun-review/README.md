# bun-revew

(This is not an AI assisted project.)

The objective is to _explore_ and _review_ code base of the [bun project](https://github.com/oven-sh/bun) via interactive or automated processes in a nixos/nix docker environment. 

Deterministic log files are committed to the git repo for interactive and automated analysis.

---

https://github.com/oven-sh/bun

---

https://ontouchstart.github.io/bun-review/Makefile

```Makefile
all:	build.log profile-list.log version.log

home/bun:
	cd home && git clone --depth=1 https://github.com/oven-sh/bun.git 
	cd home/bun && git apply ../flake.patch
	docker compose run  --remove-orphans --rm bun nix flake update

bun-debug.log: home/bun build.log
	docker compose run  --remove-orphans --rm bun nix develop --command bash -c "bun scripts/build.ts --profile=debug --asan=off"  | tee bun-debug.log

build.log:
	docker compose --progress=plain build --no-cache | tee build.log

profile-list.log:
	docker compose run  --remove-orphans --rm dev nix profile list | tee profile-list.log

version.log:
	docker compose run  --remove-orphans --rm dev nix --version | tee version.log

dev:	build.log
	docker compose run  --remove-orphans --rm bun nix develop

repl:	build.log
	docker compose run  --remove-orphans --rm dev nix repl

clean:
	rm -rf *.log home/bun
```
---

https://ontouchstart.github.io/bun-review/Dockerfile

```Dockerfile
FROM nixos/nix:2.35.2-arm64
RUN nix-channel --update
RUN echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
```
---

https://ontouchstart.github.io/bun-review/compose.yml

```yml
services:
  dev:
    build: .
  bun:
    build: .
    volumes:
      - ./home/bun:/home
    working_dir: /home
```

---

https://ontouchstart.github.io/bun-review/home/flake.patch

```
diff --git a/flake.nix b/flake.nix
index 38667c11df..c73888859c 100644
--- a/flake.nix
+++ b/flake.nix
@@ -47,8 +47,7 @@
           llvm
           lld
           pkgs.gcc
-          pkgs.rustc
-          pkgs.cargo
+          pkgs.rustup
           pkgs.go
 
           # Bun itself (for running build scripts via `bun bd`)
@@ -84,18 +83,18 @@
 
           # Chromium dependencies for Puppeteer testing (from bootstrap.sh lines 1397-1483)
           # X11 and graphics libraries
-          pkgs.xorg.libX11
-          pkgs.xorg.libxcb
-          pkgs.xorg.libXcomposite
-          pkgs.xorg.libXcursor
-          pkgs.xorg.libXdamage
-          pkgs.xorg.libXext
-          pkgs.xorg.libXfixes
-          pkgs.xorg.libXi
-          pkgs.xorg.libXrandr
-          pkgs.xorg.libXrender
-          pkgs.xorg.libXScrnSaver
-          pkgs.xorg.libXtst
+          pkgs.libX11
+          pkgs.libxcb
+          pkgs.libXcomposite
+          pkgs.libXcursor
+          pkgs.libXdamage
+          pkgs.libXext
+          pkgs.libXfixes
+          pkgs.libXi
+          pkgs.libXrandr
+          pkgs.libXrender
+          pkgs.libXScrnSaver
+          pkgs.libXtst
           pkgs.libxkbcommon
           pkgs.mesa
           pkgs.nspr
@@ -116,7 +115,7 @@
           pkgs.liberation_ttf # fonts-liberation
           pkgs.atk
           pkgs.libdrm
-          pkgs.xorg.libxshmfence
+          pkgs.libxshmfence
           pkgs.gdk-pixbuf
         ] ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
           # macOS specific dependencies
@@ -151,9 +150,35 @@
             export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath packages}''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
           '' + ''
 
+            # FIX 1: Provide a fully mutable, local Rustup stack inside the project directory
+            # This isolates Cargo files so it won't crash on Nix Store read-only errors
+            export RUSTUP_HOME="$PWD/.rustup"
+            export CARGO_HOME="$PWD/.cargo-home"
+            export PATH="$CARGO_HOME/bin:$PATH"
+
+            # Auto-install the requested toolchain and standard library code components
+            if ! rustup toolchain list | grep -q "nightly-2026-07-20"; then
+              echo "Setting up required mutable Rust toolchain..."
+              rustup toolchain install nightly-2026-07-20 --component rust-src
+            fi
+            export RUSTUP_TOOLCHAIN=nightly-2026-07-20
+            export RUSTC_BOOTSTRAP=1
+
+            # FIX 2: Bypass Clang's missing ZSTD debug compression capability
+            export RUSTFLAGS="-C link-arg=-gz=none"
+            export CFLAGS="-Wno-error=debug-compression-unavailable"
+            export CXXFLAGS="-Wno-error=debug-compression-unavailable"
+          '' + pkgs.lib.optionalString pkgs.stdenv.isLinux ''
+            export LD="${pkgs.lib.getExe' lld "ld.lld"}"
+            export NIX_CFLAGS_LINK="''${NIX_CFLAGS_LINK:+$NIX_CFLAGS_LINK }-fuse-ld=lld"
+            export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath packages}''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
+          '' + ''
+            export NIX_CFLAGS_COMPILE="-Wno-error=debug-compression-unavailable -gz=none -DWTF_USE_ADDRESS_SANITIZER=0"
+            export BUN_DEBUG_QUIET_LOGS=1
+
             # Print welcome message
             echo "====================================="
-            echo "Bun Development Environment"
+            echo "Bun Development Environment Fixed    "
             echo "====================================="
             echo "Node.js: $(node --version 2>/dev/null || echo 'not found')"
             echo "Bun: $(bun --version 2>/dev/null || echo 'not found')"
```
