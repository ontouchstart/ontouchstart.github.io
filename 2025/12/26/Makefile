all:
	make -C hello
	rm uv.lock
	uv add pytest hello/target/wheels/hello-0.1.0-cp314-cp314-macosx_11_0_arm64.whl
	uv run main.py
	uv run pytest test_sum_as_string.py -v
	

