# nix/home

```
bash-5.3# nix flake new hello
bash-5.3# cat -n hello/flake.nix 
     1	{
     2	  description = "A very basic flake";
     3	
     4	  inputs = {
     5	    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
     6	  };
     7	
     8	  outputs = inputs: {
     9	    packages = builtins.mapAttrs (system: pkgs: {
    10	      hello = pkgs.hello;
    11	
    12	      default = inputs.self.packages.${system}.hello;
    13	    }) inputs.nixpkgs.legacyPackages;
    14	  };
    15	}
```
