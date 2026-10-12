```
bash-5.3# nix flake show .
path:/home/2026-10-11/dummy?lastModified=1791769008&narHash=sha256-opECZt1wdYHYiy2ZG8x9rM2TtyRhsSbVcQADZx8txOs%3D
└───packages
    └───aarch64-linux
        └───default: package 'dummy'
bash-5.3# nix run .
dummy works!
```
