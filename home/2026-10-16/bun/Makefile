SOURCES := $(wildcard *.jsonl)
TARGETS := $(SOURCES:.jsonl=.md)

all: $(TARGETS)

%.md: %.jsonl
	cat $< | nix run /home/nix/jsonl2md > $@

bun:;git clone https://github.com/oven-sh/bun

build:bun;nix develop --command bash -c 'cd bun&&RUSTFLAGS="-C codegen-units=1 -C link-arg=-Wl,--no-mmap-output-file" NIX_CFLAGS_COMPILE="-Wno-error=debug-compression-unavailable -gz=none" bun scripts/build.ts --profile=debug' # Not working yet
