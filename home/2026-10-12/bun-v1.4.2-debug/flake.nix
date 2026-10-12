{
  outputs = { self, nixpkgs }:
    let
      system = "aarch64-linux";
    in {
      packages.${system}.default = nixpkgs.legacyPackages.${system}.stdenv.mkDerivation {
      name = "bun-v1.4.2-debug";
      src = nixpkgs.legacyPackages.${system}.fetchgit {
        url = "https://github.com/oven-sh/bun.git";
        rev = "bun-v1.4.2";
        hash = "sha256-N+4Dcac5aUmL+SMvCrMl3NRBvx0F/uFc7Ip3tRvoy6w=";
      };
      buildInputs = [ 
       nixpkgs.legacyPackages.${system}.git 
       nixpkgs.legacyPackages.${system}.cacert
       # nixpkgs.legacyPackages.${system}.cmake
       nixpkgs.legacyPackages.${system}.ninja
       nixpkgs.legacyPackages.${system}.pkg-config
       nixpkgs.legacyPackages.${system}.ccache
       nixpkgs.legacyPackages.${system}.clang_21
       nixpkgs.legacyPackages.${system}.llvm_21
       nixpkgs.legacyPackages.${system}.lld_21
       nixpkgs.legacyPackages.${system}.gcc
       nixpkgs.legacyPackages.${system}.rustup
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
      configurePhase = "";
      buildPhase = ''
        echo '#!/bin/env sh' > bun-v1.4.2-debug 
        echo 'echo "bun-v1.4.2-debug works!"' >> bun-v1.4.2-debug

        # Bun source is already here from fetchgit
#        BUN_DEBUG_QUIET_LOGS=1 bun scripts/build.ts --profile=debug --asan=off
      '';

      installPhase = ''
        mkdir -p $out/bin
#        cp build/debug/bun-debug $out/bin/bun-v1.4.2-debug
        cp bun-v1.4.2-debug $out/bin/bun-v1.4.2-debug
        chmod +x $out/bin/bun-v1.4.2-debug
      '';
      };
    }; 
}
