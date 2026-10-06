{
  description = "2026-10-06-bun";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.rustc
          pkgs.cargo
          pkgs.openssl
          pkgs.pkg-config
        ];
        shellHook = ''
          export CARGO_TARGET_DIR=/tmp/cargo-target
          export CARGO_HOME=/tmp/cargo-home
          mkdir -p $CARGO_HOME
        '';
      };
    };
}

