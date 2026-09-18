id=2026-09-18_14-16-21_conv_4b4f2bd4_how_to_sort_a_conten
all: $(id).yml

$(id).yml:
	cat $(id).jsonl | jq -s . | yj -jy > $(id).yml
