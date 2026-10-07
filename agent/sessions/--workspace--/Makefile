SOURCES := $(wildcard *.jsonl)
TARGETS := $(SOURCES:.jsonl=.md)

all: $(TARGETS)

%.md: %.jsonl
	cat $< | nix run github:nix-ontouchstart/jsonl2md --refresh > $@
