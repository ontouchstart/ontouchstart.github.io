install:
	uv add mlx_lm requests ruff ipython

build:
	echo "# 2025/12/14 run remote python files (trusted)" > README.md
	echo "```uv run remote-mlx-lm-test_generate.py &> remote-mlx-lm-test_generate.md```" >> README.md
	echo "[remote-mlx-lm-test_generate](remote-mlx-lm-test_generate)\n\n" >> README.md
	uv run remote-mlx-lm-test_generate.py &> remote-mlx-lm-test_generate.md

	echo "```uv run remote-mlx-lm-test_server.py &> remote-mlx-lm-test_server.md```" >> README.md
	echo "[remote-mlx-lm-test_server](remote-mlx-lm-test_server)\n\n" >> README.md
	uv run remote-mlx-lm-test_server.py &> remote-mlx-lm-test_server.md
