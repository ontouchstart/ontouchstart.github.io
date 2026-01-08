cargo fmt
cargo test
   Compiling rust-tests v0.1.0 (/Users/sam/github/ontouchstart.github.io/rust-notebook/src/2026/01/08/rust-tests)
error[E0308]: mismatched types
 --> tests/string_parse_test.rs:5:27
  |
5 |     assert_eq!(forty_two, "forty two");
  |                           ^^^^^^^^^^^ expected `u32`, found `&str`

For more information about this error, try `rustc --explain E0308`.
error: could not compile `rust-tests` (test "string_parse_test") due to 1 previous error
make: *** [all] Error 101
