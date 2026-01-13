# 2026/01/13

## Branch for crate

<https://github.com/ontouchstart/ontouchstart.github.io/tree/2026_01_13_rs>

```toml
[package]
name = "ontouchstart_2026_01_13_rs"
version = "0.1.0"
edition = "2024"

[dependencies]
```

## Branch for test

```toml
[package]
name = "ontouchstart_2026_01_13_rs_test"
version = "0.1.0"
edition = "2024"

[dependencies]
ontouchstart_2026_01_13_rs = { git = "https://github.com/ontouchstart/ontouchstart.github.io", branch = "2026_01_13_rs", version = "0.1.0" }
```

<https://github.com/ontouchstart/ontouchstart.github.io/tree/2026_01_13_rs_test>


## CI

<https://github.com/ontouchstart/ontouchstart.github.io/actions?query=branch%3A2026_01_13_rs+is%3Asuccess>

<https://github.com/ontouchstart/ontouchstart.github.io/actions?query=branch%3A2026_01_13_rs_test+is%3Asuccess>

```yaml
# https://github.com/actions/runner-images/blob/main/images/ubuntu/Ubuntu2404-Readme.md
name: Makefile CI (ubuntu-24.04)

on: push

jobs:
  build:

    runs-on: ubuntu-24.04

    steps:
    - uses: actions/checkout@v6
    - uses: ontouchstart/rust-toolchain@master
      with:
        toolchain: stable
    - run: cargo test --all-features
```


```yaml
# https://github.com/actions/runner-images/blob/main/images/windows/Windows2025-Readme.md
name: Makefile CI (windows-2025)

on: push

jobs:
  build:
    runs-on: windows-2025

    steps:
    - uses: actions/checkout@v6
    - uses: ontouchstart/rust-toolchain@master
      with:
        toolchain: stable
    - run: cargo test --all-features
```


```yaml
# https://github.com/actions/runner-images/blob/main/images/macos/macos-26-arm64-Readme.md
name: Makefile CI (macos-26)

on: push

jobs:
  build:
    runs-on: macos-26

    steps:
    - uses: actions/checkout@v6
    - uses: ontouchstart/rust-toolchain@master
      with:
        toolchain: stable
    - run: cargo test --all-features

```

