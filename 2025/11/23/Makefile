all:
	uv add mlx_lm
	echo "# 2025/11/23" > README.md
	echo "[What is ChatGPT?](what-is-ChatGPT)" >> README.md
	uv run what-is-ChatGPT.py > what-is-ChatGPT.md
	echo "[Wang Hao and computer assisted proof on an IMB 740](wang-hao-IBM-740-proof)" >> README.md
	echo "[Fact on Wikipedia](https://en.wikipedia.org/wiki/Hao_Wang_(academic))" >> README.md
	uv run wang-hao-IBM-740-proof.py >> tee wang-hao-IBM-740-proof.md
