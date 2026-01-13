all:
	echo "We do not need to run make in CI"
	echo "see the workflow log here"
	echo "https://github.com/ontouchstart/ontouchstart.github.io/actions?query=branch%3A2026_01_13_rs_test+is%3Asuccess"

install:
	cargo add --git https://github.com/ontouchstart/ontouchstart.github.io --branch 2026_01_13_rs ontouchstart_2026_01_13_rs
	cargo update

test:
	cargo test 
