all:
	
	@echo "# 👨🏻‍✈️🤖💻🐢🐇🕳️🐍🦀🤔"
	@echo "Every pothole has a rabbit hole underneath." 
	@echo '```' 
	uv run main.py
	make -C rust-notebook 
	make -C runtime
	@echo '```'
	@echo '© 2026  [Sam Liu](https://github.com/ontouchstart)'
