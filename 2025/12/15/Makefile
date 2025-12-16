install:
	uv add ipython ruff
	uv add requests
	uv add mlx_lm
	uv add openai

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

	echo "\n\nIt is intentional to keep these scripts self contained without shared lib because we can run the script remotely like this:\n" >> README.md

	echo '```uv run remote-ask_mlx-community_Qwen3-4B-4bit_math.py```' >> README.md
	uv run remote-ask_mlx-community_Qwen3-4B-4bit_math.py >> README.md

	echo '```uv run remote-ask_openai_gpt-oss-20b_math.py```' >> README.md
	uv run remote-ask_openai_gpt-oss-20b_math.py >> README.md

server:
	uv run mlx_lm.server

openai_tests:
	uv run openai-client-mlx-community_Mistral-7B-Instruct-v0.3.py
	uv run openai-client-mlx-community_Qwen1.5-0.5B-Chat-4bit.py
	uv run openai-client-mlx-community_Qwen3-4B-4bit.py
	uv run openai-client-openai_gpt-oss-20b.py

