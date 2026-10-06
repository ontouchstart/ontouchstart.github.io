{
  description = "2026-10-06-bun";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      shell = pkgs.mkShell {
        buildInputs = [ pkgs.bun ];
        shellHook = ''
          export PATH="${pkgs.bun}/bin:${pkgs.coreutils}/bin"
        '';
      };
    in
    {
      devShells.aarch64-linux.default = shell;
    };
}
