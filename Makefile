all:
	
	@echo "# 👨🏻‍✈️🤖💻🐇🕳️🐍🦀🤔"
	@echo "Every pothole has a rabbit hole underneath." 
	@echo '```' 
	@echo "sam@Sams-MacBook-Pro ontouchstart.github.io % uv run main.py"
	uv run main.py
	make -C rust-notebook 
	make -C runtime
	@echo '```' 
