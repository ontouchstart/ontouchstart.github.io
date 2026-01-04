all:
	@echo '`make &> make.md`'
	@echo '```'
	rm uv.lock
	uv add "ontouchstart @ git+https://github.com/ontouchstart/ontouchstart.github.io.git@2026_01_03"
	@echo '`uv run main.py`' > main.md
	@echo '```' >> main.md
	uv run main.py >> main.md
	@echo '```' >> main.md
	uv run python -m ontouchstart
	uv run python -m ontouchstart.resume > resume.md
	uv run python -m ontouchstart.ask &> ask.md
	@echo '```'
	@echo
	@echo "[main.md](main)" 
	@echo
	@echo "[resume.md](resume)" 
	@echo
	@echo "[ask.md](ask)" 


