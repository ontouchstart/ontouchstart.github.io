all:
	
	@echo "# 👨🏻‍✈️🤖💻🐢🐇🕳️🐍🦀🤔"
	@echo "Every pothole has a rabbit hole underneath." 
	@echo '```bash' 
	uv run main.py
	make -C rust-notebook 
	make -C runtime
	@echo '```'
