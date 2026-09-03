id1=2026-09-03_02-26-30_conv_c1f35bb9_chat_9_2_2026_10_11_
id2=2026-09-03_02-43-21_conv_c1f35bb9_chat_9_2_2026_10_11_

all: $(id1).yml $(id2).yml

$(id1).yml:
	cat $(id1).jsonl | jq -s . | yj -jy > $(id1).yml

$(id2).yml:
	cat $(id2).jsonl | jq -s . | yj -jy > $(id2).yml
