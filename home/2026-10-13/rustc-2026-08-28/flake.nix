{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, rust-overlay }:
    let
      system = "aarch64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ (import rust-overlay) ];
      };
      
      rustToolchain = pkgs.rust-bin.nightly."2026-08-28".default;
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [ rustToolchain ];
      };
    };
}

