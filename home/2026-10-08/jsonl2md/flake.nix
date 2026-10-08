{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";

  outputs = { self, nixpkgs }: {
    packages = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        default = pkgs.rustPlatform.buildRustPackage {
          pname = "jsonl2md";
          version = "0.1.1";
          src = ./.;
          cargoLock.lockFile = ./Cargo.lock;
        };
        test = pkgs.rustPlatform.buildRustPackage {
          pname = "jsonl2md-test";
          version = "0.1.0";
          src = ./.;
          cargoLock.lockFile = ./Cargo.lock;
          overrides = {
            # This is not how you do it in nixpkgs.buildRustPackage
          };
        };
      });
  };
}
