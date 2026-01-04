`make &> make.md`
```
rm uv.lock
uv add "ontouchstart @ git+https://github.com/ontouchstart/ontouchstart.github.io.git@2026_01_03"
Resolved 36 packages in 317ms
Audited 34 packages in 5ms
uv run main.py >> main.md
uv run python -m ontouchstart
Hello from ontouchstart!
https://github.com/ontouchstart
uv run python -m ontouchstart.resume > resume.md
uv run python -m ontouchstart.ask &> ask.md
```

[main.md](main)

[resume.md](resume)

[ask.md](ask)
