install:
	uv add ipython ruff
	uv add requests
	uv add mlx_lm

build:
	uv run ruff check
	uv run ruff format
	echo "# 2025/12/15 Ask different models the same math questions" > README.md

	echo "- [ask_mlx-community_Mistral-7B-Instruct-v0.3_math](ask_mlx-community_Mistral-7B-Instruct-v0.3_math)" >> README.md 
	uv run ask_mlx-community_Mistral-7B-Instruct-v0.3_math.py > ask_mlx-community_Mistral-7B-Instruct-v0.3_math.md

	echo "- [ask_mlx-community_Qwen1.5-0.5B-Chat-4bit_math](ask_mlx-community_Qwen1.5-0.5B-Chat-4bit_math)" >> README.md

	uv run ask_mlx-community_Qwen1.5-0.5B-Chat-4bit_math.py > ask_mlx-community_Qwen1.5-0.5B-Chat-4bit_math.md

	echo "- [ask_mlx-community_Qwen3-4B-4bit_math](ask_mlx-community_Qwen3-4B-4bit_math)" >> README.md
	uv run ask_mlx-community_Qwen3-4B-4bit_math.py > ask_mlx-community_Qwen3-4B-4bit_math.md

	echo "- [ask_openai_gpt-oss-20b_math](ask_openai_gpt-oss-20b_math)" >> README.md
	uv run ask_openai_gpt-oss-20b_math.py > ask_openai_gpt-oss-20b_math.md

	echo "It is intentional to keep these scripts self contained without shared lib." >> README.md
