`make &> make.md`
```
rm -f uv.lock
uv add "ontouchstart @ git+https://github.com/ontouchstart/ontouchstart.github.io.git@2026_01_04"
Resolved 36 packages in 167ms
Audited 34 packages in 1ms
uv run python -m ontouchstart.review &> review.md
```

[review.md](review)
