
https://ontouchstart.github.io/home/react/2026-09-29T19-53-16-272Z_01a0eeba-84f0-7455-bdeb-4deda7f9dcfb

`flake.nix`

```nix
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
          openjdk
        ];
      };
    in
    {
      devShells.default = shell;
      devShells.aarch64-linux.default = shell;
    };
}
```

