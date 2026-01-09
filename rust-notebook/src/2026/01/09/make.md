cargo install cargo-expand
    Updating crates.io index
     Ignored package `cargo-expand v1.0.119` is already installed, use --force to override
warning: be sure to add `/Users/sam/.cargo/bin` to your PATH to be able to run the installed binaries
cargo --version
cargo 1.92.0 (Homebrew)
cargo update
    Updating git repository `https://github.com/ontouchstart/ontouchstart.github.io`
     Locking 0 packages to latest Rust 1.92.0 compatible versions
cargo fmt
cargo expand -p github_url_2026_01_09_rs
    Checking github_url_2026_01_09_rs v0.1.0 (/Users/sam/github/ontouchstart.github.io/rust-notebook/src/2026/01/09/github_url_2026_01_09_rs)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.10s

#![feature(prelude_import)]
#[macro_use]
extern crate std;
#[prelude_import]
use std::prelude::rust_2024::*;
///
/// ```
/// let plant = backyard::Asparagus {};
/// ```
///
pub use backyard::Asparagus;
pub fn url() -> String {
    url::url()
}
cargo expand -p github_url_2026_01_09_rs --test github_url_2026_01_09_rs
    Checking github_url_2026_01_09_rs v0.1.0 (/Users/sam/github/ontouchstart.github.io/rust-notebook/src/2026/01/09/github_url_2026_01_09_rs)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.09s

#![feature(prelude_import)]
#[macro_use]
extern crate std;
#[prelude_import]
use std::prelude::rust_2024::*;
extern crate test;
#[rustc_test_marker = "github_url_2026_01_09_rs"]
#[doc(hidden)]
pub const github_url_2026_01_09_rs: test::TestDescAndFn = test::TestDescAndFn {
    desc: test::TestDesc {
        name: test::StaticTestName("github_url_2026_01_09_rs"),
        ignore: false,
        ignore_message: ::core::option::Option::None,
        source_file: "github_url_2026_01_09_rs/tests/github_url_2026_01_09_rs.rs",
        start_line: 2usize,
        start_col: 4usize,
        end_line: 2usize,
        end_col: 28usize,
        compile_fail: false,
        no_run: false,
        should_panic: test::ShouldPanic::No,
        test_type: test::TestType::IntegrationTest,
    },
    testfn: test::StaticTestFn(
        #[coverage(off)]
        || test::assert_test_result(github_url_2026_01_09_rs()),
    ),
};
fn github_url_2026_01_09_rs() {
    match (
        &github_url_2026_01_09_rs::url(),
        &String::from(
            "https://github.com/ontouchstart/ontouchstart.github.io/tree/2026_01_09_rs",
        ),
    ) {
        (left_val, right_val) => {
            if !(*left_val == *right_val) {
                let kind = ::core::panicking::AssertKind::Eq;
                ::core::panicking::assert_failed(
                    kind,
                    &*left_val,
                    &*right_val,
                    ::core::option::Option::None,
                );
            }
        }
    };
}
#[rustc_main]
#[coverage(off)]
#[doc(hidden)]
pub fn main() -> () {
    extern crate test;
    test::test_main_static(&[&github_url_2026_01_09_rs])
}
cargo expand -p github_url_2026_01_09_rs --test url
    Checking github_url_2026_01_09_rs v0.1.0 (/Users/sam/github/ontouchstart.github.io/rust-notebook/src/2026/01/09/github_url_2026_01_09_rs)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.10s

#![feature(prelude_import)]
#[macro_use]
extern crate std;
#[prelude_import]
use std::prelude::rust_2024::*;
extern crate test;
#[rustc_test_marker = "url"]
#[doc(hidden)]
pub const url: test::TestDescAndFn = test::TestDescAndFn {
    desc: test::TestDesc {
        name: test::StaticTestName("url"),
        ignore: false,
        ignore_message: ::core::option::Option::None,
        source_file: "github_url_2026_01_09_rs/tests/url.rs",
        start_line: 2usize,
        start_col: 4usize,
        end_line: 2usize,
        end_col: 7usize,
        compile_fail: false,
        no_run: false,
        should_panic: test::ShouldPanic::No,
        test_type: test::TestType::IntegrationTest,
    },
    testfn: test::StaticTestFn(#[coverage(off)] || test::assert_test_result(url())),
};
fn url() {
    match (
        &url::url(),
        &String::from(
            "https://github.com/ontouchstart/ontouchstart.github.io/tree/2026_01_09_rs",
        ),
    ) {
        (left_val, right_val) => {
            if !(*left_val == *right_val) {
                let kind = ::core::panicking::AssertKind::Eq;
                ::core::panicking::assert_failed(
                    kind,
                    &*left_val,
                    &*right_val,
                    ::core::option::Option::None,
                );
            }
        }
    };
}
#[rustc_main]
#[coverage(off)]
#[doc(hidden)]
pub fn main() -> () {
    extern crate test;
    test::test_main_static(&[&url])
}
cargo test -p github_url_2026_01_09_rs
    Finished `test` profile [unoptimized + debuginfo] target(s) in 0.05s
     Running unittests src/lib.rs (target/debug/deps/github_url_2026_01_09_rs-3fa4cad6854de0e4)

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running tests/github_url_2026_01_09_rs.rs (target/debug/deps/github_url_2026_01_09_rs-93184577b1117ec8)

running 1 test
test github_url_2026_01_09_rs ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running tests/url.rs (target/debug/deps/url-a8d44e6e93a907b8)

running 1 test
test url ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

   Doc-tests github_url_2026_01_09_rs

running 1 test
test github_url_2026_01_09_rs/src/lib.rs - Asparagus (line 2) ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

all doctests ran in 0.47s; merged doctests compilation took 0.20s
