SOURCES := $(wildcard *.jsonl)
TARGETS := $(SOURCES:.jsonl=.md)

all: $(TARGETS)

%.md: %.jsonl
	cat $< | nix run /home/nix/jsonl2md > $@

bun:;git clone https://github.com/oven-sh/bun&&echo 'bun' > .gitignore
