{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, rust-overlay }:
    let
      system = "aarch64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = [ (import rust-overlay) ];
      };

      # LLVM 23 - the major of pins.llvm in scripts/build/ci-images/spec.ts (actual version from nixpkgs-unstable)
      llvm = pkgs.llvmPackages_23.llvm;
      clang = pkgs.llvmPackages_23.clang;
      lld = pkgs.llvmPackages_23.lld;

      # Node.js 26 - the major of pins.nodejs in scripts/build/ci-images/spec.ts (actual version from nixpkgs-unstable)
      nodejs = pkgs.nodejs_26;

      rustToolchain = pkgs.rust-bin.nightly."2026-09-15".default.override {
        extensions = [ "rust-src" ];
      };
    in {
      packages.${system}.default = nixpkgs.legacyPackages.${system}.stdenv.mkDerivation {
      name = "bun-v1.4.3-debug";
      src = nixpkgs.legacyPackages.${system}.fetchgit {
        url = "https://github.com/oven-sh/bun.git";
        rev = "bun-v1.4.3";
        hash = "sha256-NXKOmxQHguwkGIuq9z5kFrektrxPEmFzjoBHWyOlovU=";
      };
      sandbox = false;

      buildInputs = [ 
       llvm
       clang
       lld
       rustToolchain

       nixpkgs.legacyPackages.${system}.git 
       nixpkgs.legacyPackages.${system}.cacert
       nixpkgs.legacyPackages.${system}.cmake
       nixpkgs.legacyPackages.${system}.ninja
       nixpkgs.legacyPackages.${system}.pkg-config
       nixpkgs.legacyPackages.${system}.ccache
      # nixpkgs.legacyPackages.${system}.clang_21
      # nixpkgs.legacyPackages.${system}.llvm_21
      # nixpkgs.legacyPackages.${system}.lld_21
       nixpkgs.legacyPackages.${system}.gcc
     # nixpkgs.legacyPackages.${system}.rustup
       nixpkgs.legacyPackages.${system}.go
       nixpkgs.legacyPackages.${system}.bun
       nixpkgs.legacyPackages.${system}.nodejs_26
       nixpkgs.legacyPackages.${system}.python3
       nixpkgs.legacyPackages.${system}.libtool
       nixpkgs.legacyPackages.${system}.ruby
       nixpkgs.legacyPackages.${system}.perl
       nixpkgs.legacyPackages.${system}.openssl
       nixpkgs.legacyPackages.${system}.zlib
       nixpkgs.legacyPackages.${system}.libxml2
       nixpkgs.legacyPackages.${system}.libiconv
       nixpkgs.legacyPackages.${system}.curl
       nixpkgs.legacyPackages.${system}.wget
       nixpkgs.legacyPackages.${system}.unzip
       nixpkgs.legacyPackages.${system}.xz
       nixpkgs.legacyPackages.${system}.gdb
       nixpkgs.legacyPackages.${system}.libX11
       nixpkgs.legacyPackages.${system}.libxcb
       nixpkgs.legacyPackages.${system}.libXcomposite
       nixpkgs.legacyPackages.${system}.libXcursor
       nixpkgs.legacyPackages.${system}.libXdamage
       nixpkgs.legacyPackages.${system}.libXext
       nixpkgs.legacyPackages.${system}.libXfixes
       nixpkgs.legacyPackages.${system}.libXi
       nixpkgs.legacyPackages.${system}.libXrandr
       nixpkgs.legacyPackages.${system}.libXrender
       nixpkgs.legacyPackages.${system}.libXScrnSaver
       nixpkgs.legacyPackages.${system}.libXtst
       nixpkgs.legacyPackages.${system}.libxkbcommon
       nixpkgs.legacyPackages.${system}.mesa
       nixpkgs.legacyPackages.${system}.nspr
       nixpkgs.legacyPackages.${system}.nss
       nixpkgs.legacyPackages.${system}.cups
       nixpkgs.legacyPackages.${system}.dbus
       nixpkgs.legacyPackages.${system}.expat
       nixpkgs.legacyPackages.${system}.fontconfig
       nixpkgs.legacyPackages.${system}.freetype
       nixpkgs.legacyPackages.${system}.glib
       nixpkgs.legacyPackages.${system}.gtk3
       nixpkgs.legacyPackages.${system}.pango
       nixpkgs.legacyPackages.${system}.cairo
       nixpkgs.legacyPackages.${system}.alsa-lib
       nixpkgs.legacyPackages.${system}.at-spi2-atk
       nixpkgs.legacyPackages.${system}.at-spi2-core
       nixpkgs.legacyPackages.${system}.libgbm
       nixpkgs.legacyPackages.${system}.liberation_ttf
       nixpkgs.legacyPackages.${system}.atk
       nixpkgs.legacyPackages.${system}.libdrm
       nixpkgs.legacyPackages.${system}.libxshmfence
       nixpkgs.legacyPackages.${system}.gdk-pixbuf
      ];

      phases = [ "unpackPhase" "patchPhase" "buildPhase" "installPhase" ];
      SSL_CERT_FILE = "${nixpkgs.legacyPackages.${system}.cacert}/etc/ssl/certs/ca-bundle.crt";

      buildPhase = ''
        export HOME=$PWD

        echo '#!/bin/env sh' > bun-v1.4.2-debug 
        echo 'echo "bun-v1.4.2-debug works!"' >> bun-v1.4.2-debug

        # Provide a fully mutable, local Rustup stack inside the project directory
        export RUSTUP_HOME="$PWD/.rustup"
        export CARGO_HOME="$PWD/.cargo-home"
        export PATH="$CARGO_HOME/bin:$PATH"

        # FIX 2: Bypass Clang's missing ZSTD debug compression capability
        export RUSTFLAGS="-C link-arg=-gz=none"
        export CFLAGS="-Wno-error=debug-compression-unavailable -gz=none"
        export CXXFLAGS="-Wno-error=debug-compression-unavailable -gz=none"
        export CMAKE_C_FLAGS="-Wno-error=debug-compression-unavailable -gz=none"
        export CMAKE_CXX_FLAGS="-Wno-error=debug-compression-unavailable -gz=none"
        export NIX_CFLAGS_LINK="-fuse-ld=lld"

        # Bun build configuration
        export BUN_DEBUG_QUIET_LOGS=1
        export CMAKE_BUILD_TYPE="Debug"
        export ENABLE_CCACHE="1"

        # Bun source is already here from fetchgit
        bun scripts/build.ts --profile=debug --asan=off
      '';

      installPhase = ''
        mkdir -p $out/bin
        cp build/debug/bun-debug $out/bin/bun-v1.4.2-debug
        chmod +x $out/bin/bun-v1.4.2-debug
      '';
      };
    }; 
}
