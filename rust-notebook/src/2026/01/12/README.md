# 2026/01/12 Cargo Study

Runtime code of this study is in following branch:

<https://github.com/ontouchstart/ontouchstart.github.io/tree/2026_01_12_rs>

## Cargo

```toml
[package]
name = "ontouchstart_2026_01_12_rs"
version = "0.1.0"
edition = "2024"

[dependencies]
cargo = "0.93.0"
```

As we can see in [make check](#make-check), a single dependency of `cargo = "0.93.0"` will pull in tons of packages. 
[Cargo](https://doc.rust-lang.org/cargo) is a very complex package.

## Makefile
```Makefile
all:
	ls -a

	rustup --version --verbose
	rustc --version --verbose
	cargo --version --verbose

	cargo check --verbose
	cargo build --verbose
	cargo fmt --verbose
	cargo test --verbose

	make check build fmt test expand

./bin/cargo-expand: ./bin/cargo
	cargo install cargo-expand --root .

./bin/cargo:
	cargo install cargo --root .
	cat -n .crates.toml 
	cat .crates2.json | jq .
	
check:	./bin/cargo
	./bin/cargo check --verbose

fmt:	./bin/cargo
	./bin/cargo fmt

build:	./bin/cargo
	./bin/cargo build

test:	./bin/cargo
	./bin/cargo test

expand: ./bin/cargo-expand
	./bin/cargo-expand expand --lib
	./bin/cargo-expand expand --test it_works
	

clean:
	rm -rf .crates.toml
	rm -rf .crates2.json
	rm -rf *.log
	rm -rf bin target
	ls -a
```

## GitHub Workflow

```yaml
# https://github.com/actions/runner-images/blob/main/images/macos/macos-26-arm64-Readme.md
name: Makefile CI (macos-26)

on:
  push:
    branches: [ "2026_01_12_rs" ]

jobs:
  build:
    runs-on: macos-26

    steps:
    - uses: actions/checkout@v5
    - uses: dtolnay/rust-toolchain@stable
    - name: Make
      run: make
```

```yaml
# https://github.com/actions/runner-images/blob/main/images/windows/Windows2025-Readme.md
name: Makefile CI (windows-2025)

on:
  push:
    branches: [ "2026_01_12_rs" ]

jobs:
  build:
    runs-on: windows-2025

    steps:
    - uses: actions/checkout@v5
    - uses: dtolnay/rust-toolchain@stable
    - name: Make
      run: make
```

```yaml
# https://github.com/actions/runner-images/blob/main/images/ubuntu/Ubuntu2404-Readme.md
name: Makefile CI (ubuntu-24.04)

on:
  push:
    branches: [ "2026_01_12_rs" ]

jobs:
  build:

    runs-on: ubuntu-24.04

    steps:
    - uses: actions/checkout@v5
    - uses: dtolnay/rust-toolchain@stable
    - name: Make
      run: make
```

## make check

```
% make check
./bin/cargo check --verbose
       Fresh unicode-ident v1.0.22
       Fresh regex-syntax v0.8.8
       Fresh smallvec v1.15.1
       Fresh stable_deref_trait v1.2.1
       Fresh aho-corasick v1.1.4
       Fresh version_check v0.9.5
       Fresh zeroize v1.8.2
       Fresh once_cell v1.21.3
       Fresh bitflags v2.10.0
       Fresh proc-macro2 v1.0.105
       Fresh regex-automata v0.4.13
       Fresh subtle v2.6.1
       Fresh tinyvec_macros v0.1.1
       Fresh fastrand v2.3.0
       Fresh const-oid v0.9.6
       Fresh quote v1.0.43
       Fresh bstr v1.12.1
       Fresh typenum v1.19.0
       Fresh tinyvec v1.10.0
       Fresh gix-trace v0.1.17
       Fresh syn v2.0.114
       Fresh generic-array v0.14.9
       Fresh crossbeam-utils v0.8.21
       Fresh unicode-normalization v0.1.25
       Fresh scopeguard v1.2.0
       Fresh same-file v1.0.6
       Fresh thiserror-impl v2.0.17
       Fresh gix-utils v0.3.1
       Fresh libc v0.2.180
       Fresh parking_lot_core v0.9.12
       Fresh lock_api v0.4.14
       Fresh block-buffer v0.10.4
       Fresh crypto-common v0.1.6
       Fresh walkdir v2.5.0
       Fresh crossbeam-channel v0.5.15
       Fresh thiserror v2.0.17
       Fresh digest v0.10.7
       Fresh parking_lot v0.12.5
       Fresh find-msvc-tools v0.1.7
       Fresh bytes v1.11.0
       Fresh itoa v1.0.17
       Fresh cpufeatures v0.2.17
       Fresh gix-validate v0.10.1
       Fresh prodash v30.0.1
       Fresh cc v1.2.52
       Fresh byteorder v1.5.0
       Fresh equivalent v1.0.2
       Fresh pkg-config v0.3.32
       Fresh synstructure v0.13.2
       Fresh errno v0.3.14
       Fresh gix-path v0.10.22
       Fresh hash32 v0.3.1
       Fresh sha1 v0.10.6
       Fresh winnow v0.7.14
       Fresh vcpkg v0.2.15
       Fresh foldhash v0.1.5
       Fresh allocator-api2 v0.2.21
       Fresh zerofrom-derive v0.1.6
       Fresh gix-features v0.43.1
       Fresh heapless v0.8.0
       Fresh rustix v1.1.3
       Fresh hashbrown v0.15.5
       Fresh sha1-checked v0.10.0
       Fresh jiff v0.2.18
       Fresh zerofrom v0.1.6
       Fresh yoke-derive v0.8.1
       Fresh faster-hex v0.10.0
       Fresh getrandom v0.3.4
       Fresh gix-date v0.10.7
       Fresh yoke v0.8.1
       Fresh zerovec-derive v0.11.2
       Fresh displaydoc v0.2.5
       Fresh memmap2 v0.9.9
       Fresh gix-hash v0.19.0
       Fresh serde_core v1.0.228
       Fresh gix-actor v0.35.6
       Fresh zerovec v0.11.5
       Fresh tempfile v3.24.0
       Fresh writeable v0.6.2
       Fresh litemap v0.8.1
       Fresh hashbrown v0.14.5
       Fresh zerotrie v0.2.3
       Fresh gix-hashtable v0.9.0
       Fresh tinystr v0.8.2
       Fresh dashmap v6.1.0
       Fresh potential_utf v0.1.4
       Fresh gix-fs v0.16.1
       Fresh gix-chunk v0.4.12
       Fresh gix-quote v0.6.1
       Fresh gix-object v0.50.2
       Fresh icu_locale_core v2.1.1
       Fresh icu_collections v2.1.1
       Fresh gix-tempfile v18.0.0
       Fresh gix-commitgraph v0.29.0
       Fresh getrandom v0.2.17
       Fresh utf8_iter v1.0.4
       Fresh icu_provider v2.1.1
       Fresh icu_properties_data v2.1.2
       Fresh icu_normalizer_data v2.1.1
       Fresh gix-lock v18.0.0
       Fresh gix-revwalk v0.21.0
       Fresh percent-encoding v2.3.2
       Fresh rand_core v0.6.4
       Fresh gix-glob v0.21.0
       Fresh gix-config-value v0.15.3
       Fresh icu_normalizer v2.1.1
       Fresh icu_properties v2.1.2
       Fresh form_urlencoded v1.2.2
       Fresh unicode-bom v2.0.3
       Fresh openssl-sys v0.9.111
       Fresh libz-sys v1.1.23
       Fresh static_assertions v1.1.0
       Fresh base64ct v1.8.3
       Fresh idna_adapter v1.2.1
       Fresh kstring v2.0.2
       Fresh pem-rfc7468 v0.7.0
       Fresh serde_derive v1.0.228
       Fresh gix-sec v0.12.2
       Fresh shell-words v1.1.1
       Fresh log v0.4.29
       Fresh idna v1.1.0
       Fresh serde v1.0.228
       Fresh gix-attributes v0.27.0
       Fresh der v0.7.10
       Fresh gix-command v0.6.5
       Fresh gix-ref v0.53.1
       Fresh libnghttp2-sys v0.1.11+1.64.0
       Fresh url v2.5.8
       Fresh spki v0.7.3
       Fresh zmij v1.0.13
       Fresh hmac v0.12.1
       Fresh curl-sys v0.4.85+curl-8.18.0
       Fresh gix-traverse v0.47.0
       Fresh ff v0.13.1
       Fresh serde_json v1.0.149
       Fresh pkcs8 v0.10.2
       Fresh gix-bitmap v0.2.15
       Fresh socket2 v0.6.1
       Fresh tracing-core v0.1.36
       Fresh base16ct v0.2.0
       Fresh cfg-if v1.0.4
       Fresh fnv v1.0.7
       Fresh autocfg v1.5.0
       Fresh openssl-probe v0.1.6
       Fresh sec1 v0.7.3
       Fresh group v0.13.0
       Fresh gix-url v0.32.0
       Fresh hkdf v0.12.4
       Fresh gix-pathspec v0.12.0
       Fresh gix-ignore v0.16.0
       Fresh curl v0.4.49
       Fresh gix-index v0.41.0
       Fresh crypto-bigint v0.5.5
       Fresh tracing-attributes v0.1.31
       Fresh core-foundation-sys v0.8.7
       Fresh utf8parse v0.2.2
       Fresh powerfmt v0.2.0
       Fresh anstyle v1.0.13
       Fresh pin-project-lite v0.2.16
       Fresh objc2-encode v4.1.0
       Fresh gix-worktree v0.42.0
       Fresh anstyle-parse v0.2.7
       Fresh deranged v0.5.5
       Fresh objc2 v0.6.3
       Fresh tracing v0.1.44
       Fresh elliptic-curve v0.13.8
       Fresh gix-prompt v0.11.2
       Fresh gix-revision v0.35.0
       Fresh gix-packetline-blocking v0.19.3
       Fresh encoding_rs v0.8.35
       Fresh time-core v0.1.6
       Fresh colorchoice v1.0.4
       Fresh is_terminal_polyfill v1.70.2
       Fresh anstyle-query v1.1.5
       Fresh num-conv v0.1.0
       Fresh hashbrown v0.16.1
       Fresh cfg_aliases v0.2.1
       Fresh anstream v0.6.21
       Fresh gix-filter v0.20.0
       Fresh time v0.3.44
       Fresh indexmap v2.13.0
       Fresh gix-refspec v0.31.0
       Fresh gix-credentials v0.30.0
       Fresh rustversion v1.0.22
       Fresh num-traits v0.2.19
       Fresh anyhow v1.0.100
       Fresh zerocopy v0.8.33
       Fresh typeid v1.0.3
       Fresh core-foundation v0.10.1
       Fresh libssh2-sys v0.3.1
       Fresh crc32fast v1.5.0
       Fresh filetime v0.2.26
       Fresh rfc6979 v0.4.0
       Fresh gix-discover v0.41.0
       Fresh signature v2.2.0
       Fresh toml_datetime v0.7.5+spec-1.1.0
       Fresh serde_spanned v1.0.4
       Fresh gix-packetline v0.19.3
       Fresh imara-diff v0.1.8
       Fresh terminal_size v0.4.3
       Fresh toml_parser v1.0.6+spec-1.1.0
       Fresh sha2 v0.10.9
       Fresh crossbeam-epoch v0.9.18
       Fresh strsim v0.11.1
       Fresh lazy_static v1.5.0
       Fresh clru v0.6.2
       Fresh toml_writer v1.0.6+spec-1.1.0
       Fresh minimal-lexical v0.2.1
       Fresh base64 v0.22.1
       Fresh memchr v2.7.6
       Fresh clap_lex v0.7.7
       Fresh zlib-rs v0.5.5
       Fresh crossbeam-deque v0.8.6
       Fresh flate2 v1.1.8
       Fresh clap_builder v4.5.54
       Fresh gix-pack v0.60.0
       Fresh gix-transport v0.48.0
       Fresh nom v7.1.3
       Fresh sharded-slab v0.1.7
       Fresh gix-diff v0.53.0
       Fresh ppv-lite86 v0.2.21
       Fresh libgit2-sys v0.18.3+1.9.2
       Fresh gix-dir v0.15.0
       Fresh ecdsa v0.16.9
       Fresh erased-serde v0.4.9
       Fresh arc-swap v1.8.0
       Fresh ordered-float v2.10.1
       Fresh objc2-core-foundation v0.3.2
       Fresh primeorder v0.13.6
       Fresh block2 v0.6.2
       Fresh security-framework-sys v2.15.0
       Fresh tracing-log v0.2.0
       Fresh gix-config v0.46.0
       Fresh globset v0.4.18
       Fresh gix-shallow v0.5.0
       Fresh gix-negotiate v0.21.0
       Fresh rand_core v0.9.4
       Fresh maybe-async v0.2.10
       Fresh bitmaps v2.1.0
       Fresh matchers v0.2.0
       Fresh thread_local v1.1.9
       Fresh fiat-crypto v0.3.0
       Fresh nu-ansi-term v0.50.3
       Fresh ignore v0.4.25
       Fresh gix-protocol v0.51.0
       Fresh gix-submodule v0.20.0
       Fresh sized-chunks v0.6.5
       Fresh rand_chacha v0.9.0
       Fresh orion v0.17.12
       Fresh tracing-subscriber v0.3.22
       Fresh serde-value v0.7.0
       Fresh serde-untagged v0.1.9
       Fresh p384 v0.13.1
       Fresh nix v0.30.1
       Fresh objc2-foundation v0.3.2
       Fresh security-framework v3.5.1
       Fresh gix-status v0.20.0
       Fresh gix-odb v0.70.0
       Fresh color-print-proc-macro v0.3.7
       Fresh clap v4.5.54
       Fresh git2 v0.20.3
       Fresh toml v0.9.11+spec-1.1.0
       Fresh libsqlite3-sys v0.35.0
       Fresh cargo-credential v0.4.9
       Fresh rand_xoshiro v0.6.0
       Fresh semver v1.0.27
       Fresh ed25519-compact v2.2.0
       Fresh hashlink v0.10.0
       Fresh regex v1.12.2
       Fresh jobserver v0.1.34
       Fresh constant_time_eq v0.4.2
       Fresh shlex v1.3.0
       Fresh fallible-iterator v0.3.0
       Fresh ct-codecs v1.1.6
       Fresh unicode-width v0.2.2
       Fresh shell-escape v0.1.5
       Fresh fallible-streaming-iterator v0.1.9
       Fresh is_executable v1.0.5
       Fresh hex v0.4.3
       Fresh either v1.15.0
       Fresh arrayvec v0.7.6
       Fresh arrayref v0.3.9
       Fresh unicode-xid v0.2.6
       Fresh annotate-snippets v0.12.10
       Fresh pasetors v0.7.7
       Fresh gix v0.73.0
       Fresh blake3 v1.8.3
       Fresh cargo-util-schemas v0.10.2
       Fresh rusqlite v0.37.0
       Fresh clap_complete v4.5.65
       Fresh cargo-util v0.2.25
       Fresh itertools v0.14.0
       Fresh color-print v0.3.7
       Fresh im-rc v15.1.0
       Fresh cargo-credential-macos-keychain v0.4.18
       Fresh git2-curl v0.21.0
       Fresh tracing-chrome v0.7.2
       Fresh os_info v3.14.0
       Fresh rand v0.9.2
       Fresh toml_edit v0.23.10+spec-1.0.0
       Fresh rustfix v0.9.4
       Fresh crates-io v0.40.15
       Fresh tar v0.4.44
       Fresh serde_ignored v0.1.14
       Fresh cargo-platform v0.3.2
       Fresh http-auth v0.1.10
       Fresh home v0.5.12
       Fresh pathdiff v0.2.3
       Fresh rustc-hash v2.1.1
       Fresh lazycell v1.3.0
       Fresh rustc-stable-hash v0.1.2
       Fresh unicase v2.9.0
       Fresh supports-unicode v3.0.0
       Fresh opener v0.8.3
       Fresh supports-hyperlinks v3.2.0
       Fresh glob v0.3.3
       Fresh cargo v0.93.0
       Fresh ontouchstart_2026_01_12_rs v0.1.0 (/Users/sam/github/2026_01_12_rs)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.27s
```

## make test

```
% make test
./bin/cargo test
    Finished `test` profile [unoptimized + debuginfo] target(s) in 0.62s
     Running unittests src/lib.rs (target/debug/deps/ontouchstart_2026_01_12_rs-0b95403f4ed9c46c)

running 1 test
test tests::it_works ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running tests/it_works.rs (target/debug/deps/it_works-9bb95cc322ef9086)

running 1 test
test tests::it_works ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

   Doc-tests ontouchstart_2026_01_12_rs

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

## make expand

```
% make expand
./bin/cargo-expand expand --lib
    Checking ontouchstart_2026_01_12_rs v0.1.0 (/Users/sam/github/2026_01_12_rs)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.39s

#![feature(prelude_import)]
#[macro_use]
extern crate std;
#[prelude_import]
use std::prelude::rust_2024::*;
pub fn add(left: u64, right: u64) -> u64 {
    left + right
}
./bin/cargo-expand expand --test it_works
    Checking ontouchstart_2026_01_12_rs v0.1.0 (/Users/sam/github/2026_01_12_rs)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.35s

#![feature(prelude_import)]
#[macro_use]
extern crate std;
#[prelude_import]
use std::prelude::rust_2024::*;
mod tests {
    extern crate test;
    #[rustc_test_marker = "tests::it_works"]
    #[doc(hidden)]
    pub const it_works: test::TestDescAndFn = test::TestDescAndFn {
        desc: test::TestDesc {
            name: test::StaticTestName("tests::it_works"),
            ignore: false,
            ignore_message: ::core::option::Option::None,
            source_file: "tests/it_works.rs",
            start_line: 4usize,
            start_col: 8usize,
            end_line: 4usize,
            end_col: 16usize,
            compile_fail: false,
            no_run: false,
            should_panic: test::ShouldPanic::No,
            test_type: test::TestType::IntegrationTest,
        },
        testfn: test::StaticTestFn(
            #[coverage(off)]
            || test::assert_test_result(it_works()),
        ),
    };
    fn it_works() {
        let result = ontouchstart_2026_01_12_rs::add(2, 2);
        match (&result, &4) {
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
}
#[rustc_main]
#[coverage(off)]
#[doc(hidden)]
pub fn main() -> () {
    extern crate test;
    test::test_main_static(&[&it_works])
}

```
