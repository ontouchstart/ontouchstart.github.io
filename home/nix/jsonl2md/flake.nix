{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";

  outputs = { self, nixpkgs }: {
    packages = nixpkgs.lib.genAttrs [ "aarch64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        default = pkgs.rustPlatform.buildRustPackage {
          pname = "jsonl2md";
          version = "0.1.1";
          src = ./.;
          cargoLock.lockFile = ./Cargo.lock;
        };
      });
  };
}
