SOURCES := $(wildcard *.jsonl)
TARGETS := $(SOURCES:.jsonl=.md)

all: $(TARGETS)

%.md: %.jsonl
	cat $< | nix run ../jsonl2md > $@

clean:
	rm *.md
