{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  outputs = { self, nixpkgs }: {
    packages.aarch64-linux.default = nixpkgs.legacyPackages.aarch64-linux.writeShellScriptBin "bootstrap" "nix flake show && cat -n flake.nix";
  };
}
