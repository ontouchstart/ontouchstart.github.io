{
  description = "React repository";
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
        buildInputs = with pkgs; [
          nodejs
          yarn
          git
          bash
          pkg-config
          python3
          cmake
          libgcc
          autoconf
          automake
          libtool
          zlib
          libpng
          optipng
          gifsicle
          openjdk
        ];
      };
    in
    {
      devShells.default = shell;
      devShells.aarch64-linux.default = shell;
    };
}
