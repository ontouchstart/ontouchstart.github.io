all:
	
	echo "Every pothole has a rabbit hole underneath." > README.md
	echo "- Live a healthy life" >> README.md
	echo "- Stay away from social media" >> README.md
	echo "- Read books and long form articles" >> README.md
	echo "- Learn by doing" >> README.md 
	echo >> README.md
	echo '```' >> README.md
	echo "sam@Sams-MacBook-Pro ontouchstart.github.io % uv run main.py" >> README.md
	uv run main.py >> README.md
	echo '```' >> README.md
