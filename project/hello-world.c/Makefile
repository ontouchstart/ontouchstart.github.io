test:
	uv run pytest -s test.py
	@echo '```'
	uv run hello.py
	gcc -o hello hello.c
	./hello
	@echo  '```'

install:
	uv add pytest-playwright mlx_lm
	uv run playwright install

