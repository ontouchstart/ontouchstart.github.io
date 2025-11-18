test:
	uv run pytest -s test.py
	uv run hello.py
	gcc -o hello hello.c
	./hello

install:
	uv add pytest-playwright mlx_lm
	uv run playwright install

