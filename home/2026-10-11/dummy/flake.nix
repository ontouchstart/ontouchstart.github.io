{
  outputs = { self, nixpkgs }:
    let
      system = "aarch64-linux";
    in {
      packages.${system}.default = nixpkgs.legacyPackages.${system}.stdenv.mkDerivation {
      name = "dummy";
      src = ./.;
      buildInputs = [ ];
      buildPhase = ''
        echo '#!/bin/env sh' > dummy 
        echo 'echo "dummy works!"' >> dummy
      '';

      installPhase = ''
        mkdir -p $out/bin
        cp dummy $out/bin/
        chmod +x $out/bin/dummy
      '';
      };
    }; 
}
