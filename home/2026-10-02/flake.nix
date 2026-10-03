{
  description = "Minimum development shell for Rust, libcurl, and libsqlite3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      shell = pkgs.mkShell {
        buildInputs = [
          pkgs.rustc
          pkgs.cargo
          pkgs.curl
          pkgs.sqlite
          pkgs.fossil
          pkgs.pkg-config
          pkgs.openssl
        ];
        shellHook = ''
          export CARGO_TARGET_DIR=/tmp/cargo-target
          export CARGO_HOME=/tmp/cargo-home
          mkdir -p $CARGO_HOME
        '';
      };
    in
    {
      devShells.default = shell;
      devShells.aarch64-linux.default = shell;
    };
}
