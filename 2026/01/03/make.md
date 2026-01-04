`make &> make.md`
```
rm uv.lock
uv add "ontouchstart @ git+https://github.com/ontouchstart/ontouchstart.github.io.git@2026_01_03"
   Updating https://github.com/ontouchstart/ontouchstart.github.io.git (2026_01_03)
    Updated https://github.com/ontouchstart/ontouchstart.github.io.git (15f2a2b25709bb5ce6a2d210e006cdf059ee85ff)
Resolved 36 packages in 3.25s
   Building ontouchstart @ git+https://github.com/ontouchstart/ontouchstart.github.io.git@15f2a2b25709bb5ce6a2d210e006cdf059ee85ff
      Built ontouchstart @ git+https://github.com/ontouchstart/ontouchstart.github.io.git@15f2a2b25709bb5ce6a2d210e006cdf059ee85ff
Prepared 1 package in 17.87s
Uninstalled 1 package in 2ms
Installed 1 package in 2ms
 - ontouchstart==0.1.0 (from git+https://github.com/ontouchstart/ontouchstart.github.io.git@5b256f4a71d8682d471cb35e7e012fb7123582ad)
 + ontouchstart==0.1.0 (from git+https://github.com/ontouchstart/ontouchstart.github.io.git@15f2a2b25709bb5ce6a2d210e006cdf059ee85ff)
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
