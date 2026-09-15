{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {} }:

pkgs.stdenv.mkDerivation {
  name = "hi-go";
  buildInputs = [ pkgs.go ];
  src = ./.;

  buildPhase = ''
    export CGO_ENABLED=0
    export GOCACHE=$TMPDIR/go-cache
    go build -o hi main.go
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp hi $out/bin/
  '';
}

