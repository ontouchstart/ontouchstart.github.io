{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = inputs:
    let
      system = "aarch64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in {
      packages.${system} = {
        hello = pkgs.hello;
        default = pkgs.hello;
      };
    };
}

