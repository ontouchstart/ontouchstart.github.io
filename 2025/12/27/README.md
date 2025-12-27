# 2025/12/27 Code Review

- [code_review_medium.py](code_review_medium.py)
- [code_review_medium](code_review_medium)


```
% make
rm -rf uv.lock .venv
uv add ruff pytest 
uv add "git+https://github.com/ontouchstart/ontouchstart.github.io@ask_mlx_lm" --no-cache
uv run ruff check
All checks passed!
uv run ruff format
4 files left unchanged
```
