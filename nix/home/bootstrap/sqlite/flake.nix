{
  description = "SQLite hello world project";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # This allows 'nix build'
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        pname = "bootstrap-sqlite";
        version = "0.1";
        src = ./.;

        buildInputs = [
          pkgs.sqlite
          pkgs.pkg-config
        ];

        buildPhase = ''
          gcc main.c -o bootstrap-sqlite  $(pkg-config --cflags --libs sqlite3)
        '';

        installPhase = ''
          mkdir -p $out/bin
          cp bootstrap-sqlite $out/bin/
        '';
      };

      # This still allows 'nix develop'
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.sqlite
          pkgs.pkg-config
          pkgs.gcc
        ];
      };
    };
}
