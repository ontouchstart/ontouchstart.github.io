id1=2026-08-31_11-26-26_conv_260146b8
id2=2026-08-31_14-05-55_conv_fd5bf55a
all: $(id1).yml $(id2).yml

$(id1).yml:
	cat $(id1).jsonl | jq -s . | yj -jy > $(id1).yml

$(id2).yml:
	cat $(id2).jsonl | jq -s . | yj -jy > $(id2).yml
