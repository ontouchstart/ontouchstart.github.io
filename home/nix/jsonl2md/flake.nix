{
  inputs.nixpkgs.url = "/home/nix/nixpkgs";

  outputs = { self, nixpkgs }: {
    packages = nixpkgs.lib.genAttrs [ "aarch64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        default = pkgs.rustPlatform.buildRustPackage {
          pname = "jsonl2md";
          version = "0.1.2";
          src = ./.;
          cargoLock.lockFile = ./Cargo.lock;
        };
      });
  };
}
