id=2026-09-01_20-24-58_conv_f91d564b
all: $(id).yml

$(id).yml:
	cat $(id).jsonl | jq -s . | yj -jy > $(id).yml
