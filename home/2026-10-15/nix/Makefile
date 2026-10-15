SOURCES := $(wildcard *.jsonl)
TARGETS := $(SOURCES:.jsonl=.md)

all: $(TARGETS)

%.md: %.jsonl
	cat $< | nix run ./jsonl2md > $@

nix:;git clone https://github.com/NixOS/nix
clean:;rm -rf nix
