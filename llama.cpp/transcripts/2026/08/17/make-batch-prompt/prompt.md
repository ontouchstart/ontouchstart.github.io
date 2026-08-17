cli=../../../../../build/bin/llama-cli
all:
	cat Makefile > prompt1.md
	cat prompt?.md > prompt.md
	$(cli) --server-base http://localhost:8080 --file prompt.md --single-turn --output transcript.md

Explain how Makefile works.
