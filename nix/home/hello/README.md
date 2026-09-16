```
bash-5.3# nix flake show
path:/home/hello?lastModified=1789573028&narHash=sha256-IBESA6Eu0rX74x345Gjnf8dKTp%2B8W8O%2Bl/hNVu1Tzxo%3D
└───packages
    └───aarch64-linux
        ├───default: package 'hello-2.12.3'
        └───hello: package 'hello-2.12.3'
bash-5.3# nix run
Hello, world!
```
