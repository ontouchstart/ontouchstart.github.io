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

```rust
mod enums;

pub use enums::SpreadsheetCell;
```

```rust
#[derive(Debug)]
pub enum SpreadsheetCell {
    Int(i32),
    Float(f64),
    Text(String),
}
```

## Branch for test

<https://github.com/ontouchstart/ontouchstart.github.io/tree/2026_01_13_rs_test>

```toml
[package]
name = "ontouchstart_2026_01_13_rs_test"
version = "0.1.0"
edition = "2024"

[dependencies]
ontouchstart_2026_01_13_rs = { git = "https://github.com/ontouchstart/ontouchstart.github.io", branch = "2026_01_13_rs", version = "0.1.0" }
```

```rust
#[cfg(test)]
mod tests {
    #[test]
    fn vec_new() {
        let v: Vec<i32> = Vec::new();
        assert_eq!(format!("{:#?}", v), "[]");
    }

    #[test]
    fn vec_macro() {
        let v = vec![1, 2, 3];
        assert_eq!(format!("{:#?}", v), "[\n    1,\n    2,\n    3,\n]");
    }

    #[test]
    fn vec_push() {
        let mut v = Vec::new();
        assert_eq!(format!("{:#?}", v), "[]");

        v.push(5);
        v.push(6);
        v.push(7);
        v.push(8);
        assert_eq!(format!("{:#?}", v), "[\n    5,\n    6,\n    7,\n    8,\n]");
    }

    #[test]
    fn vec_match() {
        let v = vec![1, 2, 3, 4, 5];

        let third: &i32 = &v[2];
        assert_eq!(third, &v[2]);

        let third: Option<&i32> = v.get(2);
        match third {
            Some(third) => assert_eq!(
                format!("The third element is {third}"),
                "The third element is 3"
            ),
            None => assert_eq!("no match", "no match"),
        }
    }

    #[test]
    fn vec_no_match() {
        let v = vec![1, 2, 3, 4, 5];

        let sixth: Option<&i32> = v.get(5);
        match sixth {
            Some(sixth) => assert_eq!(
                format!("The sixth element is {sixth}"),
                "The sixth element is 6"
            ),
            None => assert_eq!("no match", "no match"),
        }
    }
}
```

```rust
#[cfg(test)]
mod tests {
    #[test]
    fn vec_enum() {
        let v = vec![
            ontouchstart_2026_01_13_rs::SpreadsheetCell::Int(3),
            ontouchstart_2026_01_13_rs::SpreadsheetCell::Text(String::from("blue")),
            ontouchstart_2026_01_13_rs::SpreadsheetCell::Float(10.12),
        ];

        assert_eq!(
            format!("{:#?}", v.get(0)),
            "Some(\n    Int(\n        3,\n    ),\n)"
        );
        assert_eq!(
            format!("{:#?}", v.get(1)),
            "Some(\n    Text(\n        \"blue\",\n    ),\n)"
        );
        assert_eq!(
            format!("{:#?}", v.get(2)),
            "Some(\n    Float(\n        10.12,\n    ),\n)"
        );
        assert_eq!(format!("{:#?}", v.get(3)), "None");
    }
}
```

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

