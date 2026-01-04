`make &> make.md`
```
rm uv.lock
uv add "ontouchstart @ git+https://github.com/ontouchstart/ontouchstart.github.io.git@2026_01_03"
   Updating https://github.com/ontouchstart/ontouchstart.github.io.git (2026_01_03)
    Updated https://github.com/ontouchstart/ontouchstart.github.io.git (5b256f4a71d8682d471cb35e7e012fb7123582ad)
Resolved 36 packages in 2.59s
   Building ontouchstart @ git+https://github.com/ontouchstart/ontouchstart.github.io.git@5b256f4a71d8682d471cb35e7e012fb7123582ad
      Built ontouchstart @ git+https://github.com/ontouchstart/ontouchstart.github.io.git@5b256f4a71d8682d471cb35e7e012fb7123582ad
Prepared 1 package in 12.11s
Uninstalled 1 package in 2ms
Installed 1 package in 1ms
 - ontouchstart==0.1.0 (from git+https://github.com/ontouchstart/ontouchstart.github.io.git@af0c558d73122251d1e591f5c128e72fc5be00e6)
 + ontouchstart==0.1.0 (from git+https://github.com/ontouchstart/ontouchstart.github.io.git@5b256f4a71d8682d471cb35e7e012fb7123582ad)
uv run main.py >> main.md
uv run python -m ontouchstart
Hello from ontouchstart!
https://github.com/ontouchstart
uv run python -m ontouchstart.resume > resume.txt
uv run python -m ontouchstart.ask &> ask.md
```

[main.md](main)

[resume.txt](resume.txt)

[ask.md](ask)
