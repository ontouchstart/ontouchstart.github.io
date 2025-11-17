all:
	@echo '```'
	cargo build --release
	gcc test.c -Ltarget/release -lhello -o test
	LD_LIBRARY_PATH=target/release ./test
	python3 call_hello.py
	@echo '```'
