SOURCES := $(wildcard *.jsonl)
TARGETS := $(SOURCES:.jsonl=.md)

all: $(TARGETS)

%.md: %.jsonl
	cat $< | nix run /home/nix/jsonl2md > $@

nix:;git clone https://github.com/NixOS/nix&&echo 'nix' > .gitignore

test:;cd nix && nix develop --command bash -c 'meson setup build&&meson test -C build'
