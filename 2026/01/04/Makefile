all:
	@echo '`make &> make.md`'
	@echo '```'
	rm -f uv.lock
	uv add "ontouchstart @ git+https://github.com/ontouchstart/ontouchstart.github.io.git@2026_01_04"
	uv run python -m ontouchstart.review &> review.md
	@echo '```'
	@echo
	@echo "[review.md](review)" 


