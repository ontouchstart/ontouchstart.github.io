{
  description = "nix docker say hi";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        
        # Compile the Go app
        hiApp = pkgs.buildGoModule {
          pname = "hi";
          version = "0.1.0";
          src = ./.;
          vendorFalse = true;
          # Set to null to trigger the build; Nix will error and tell you 
          # the correct hash to put here for reproducibility.
          vendorHash = null; 
        };

        # Create a minimal Docker image
        dockerImage = pkgs.dockerTools.buildImage {
          name = "nix-docker-say-hi";
          tag = "latest";
          config = {
            Cmd = [ "${hiApp}/bin/hi" ];
          };
          copyToRoot = [ hiApp ];
        };
      in
      {
        packages.default = hiApp;
        # This allows you to run 'nix build .#container' to get a docker tarball
        packages.container = dockerImage;
      }
    );
}

