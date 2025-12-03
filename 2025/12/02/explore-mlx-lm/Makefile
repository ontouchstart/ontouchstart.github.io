all:
	uv add mlx-lm requests
	echo "# Fetch URL and translate to Chinese" > README.md
	echo '`uv run fetch_url_and_translate_to_chinese.py`' >> README.md
	echo >> README.md
	uv run fetch_url_and_translate_to_chinese.py >> README.md
