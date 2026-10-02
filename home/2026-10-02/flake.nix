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
        ];
      };
    in
    {
      devShells.default = shell;
      devShells.aarch64-linux.default = shell;
    };
}
