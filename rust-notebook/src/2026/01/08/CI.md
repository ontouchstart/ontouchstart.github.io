```
  make -C rust-notebook/src/2026/01/08 test
  shell: /usr/bin/bash -e {0}
  env:
    UV_PYTHON_INSTALL_DIR: /home/runner/work/_temp/uv-python-dir
    UV_CACHE_DIR: /home/runner/work/_temp/setup-uv-cache
    CARGO_HOME: /home/runner/.cargo
    CARGO_INCREMENTAL: 0
    CARGO_TERM_COLOR: always
make: Entering directory '/home/runner/work/ontouchstart.github.io/ontouchstart.github.io/rust-notebook/src/2026/01/08'
make -C rust-tests
make[1]: Entering directory '/home/runner/work/ontouchstart.github.io/ontouchstart.github.io/rust-notebook/src/2026/01/08/rust-tests'
cargo fmt
cargo test
   Compiling rust-tests v0.1.0 (/home/runner/work/ontouchstart.github.io/ontouchstart.github.io/rust-notebook/src/2026/01/08/rust-tests)
    Finished `test` profile [unoptimized + debuginfo] target(s) in 0.32s
     Running unittests src/lib.rs (target/debug/deps/rust_tests-17581bfe6cd1ed72)

running 3 tests
test it_works ... ok
test largest::test_largest ... ok
test test_largest ... ok

test result: ok. 3 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running tests/it_works.rs (target/debug/deps/it_works-f753db805bc15004)

running 1 test
test it_works ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running tests/largest.rs (target/debug/deps/largest-73ac015402446edd)

running 1 test
test test_largest ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running tests/mutable.rs (target/debug/deps/mutable-68b3fb63523ccb8b)

running 1 test
test mutable ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running tests/shadowing.rs (target/debug/deps/shadowing-d3ae32e3218ab7c3)

running 1 test
test shadowing ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running tests/string_mutation.rs (target/debug/deps/string_mutation-ea1451a308f0ff8b)

running 1 test
test string_mutation ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running tests/string_parse.rs (target/debug/deps/string_parse-106e601fa3aa1186)

running 1 test
test string_parse ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

   Doc-tests rust_tests

running 2 tests
test src/largest.rs - largest::largest (line 2) ... ok
test src/lib.rs - add (line 1) ... ok

test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

all doctests ran in 0.16s; merged doctests compilation took 0.15s
make[1]: Leaving directory '/home/runner/work/ontouchstart.github.io/ontouchstart.github.io/rust-notebook/src/2026/01/08/rust-tests'
make: Leaving directory '/home/runner/work/ontouchstart.github.io/ontouchstart.github.io/rust-notebook/src/2026/01/08'
```
