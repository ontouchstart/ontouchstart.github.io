all:
	@echo '`make &> make.md`'
	@echo '```'
	rm uv.lock
	uv add "ontouchstart @ git+https://github.com/ontouchstart/ontouchstart.github.io.git@2026_01_03"
	uv run main.py
	uv run python -m ontouchstart
	uv run python -m ontouchstart.resume
	@echo '```'


