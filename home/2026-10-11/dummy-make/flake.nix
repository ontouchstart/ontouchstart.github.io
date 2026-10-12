{
  outputs = { self, nixpkgs }:
    let
      system = "aarch64-linux";
    in {
      packages.${system}.default = nixpkgs.legacyPackages.${system}.stdenv.mkDerivation {
      name = "dummy-make";
      src = ./.;
      buildInputs = [ ];
      buildPhase = ''
        make  build
      '';

      installPhase = ''
        mkdir -p $out/bin
        cp dummy-make $out/bin/
        chmod +x $out/bin/dummy-make
      '';
      };
    }; 
}
