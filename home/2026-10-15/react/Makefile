SOURCES := $(wildcard *.jsonl)
TARGETS := $(SOURCES:.jsonl=.md)

all: $(TARGETS)

%.md: %.jsonl
	cat $< | nix run ./jsonl2md > $@

react:;git clone https://github.com/react/react&&echo 'react' > .gitignore
