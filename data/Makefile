# Find all .jsonl files in the current directory
SOURCES = $(wildcard *.jsonl)

# Create a list of .md filenames by replacing .jsonl with .md
TARGETS = $(SOURCES:.jsonl=.md)

.PHONY: all
all: $(TARGETS)

# Pattern Rule:
# This tells Make: "To create any .md file, look for a .jsonl file with the same name."
%.md: %.jsonl
	jq .message.content $< | tail -1 | sed 's/\\n/\n/g' | sed 's/\\"/\"/g' > $@

