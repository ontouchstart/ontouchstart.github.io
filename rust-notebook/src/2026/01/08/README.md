# notebook_2026_01_08

For an experienced software to learn a new programming language like [rust](https://doc.rust-lang.org) 
and its ecosystem, before dive deep into <https://crates.io>, it might be  a good idea to go through 
[The Rust Programming Language Book](https://doc.rust-lang.org/stable/book) by taking notes as 
[tests](https://doc.rust-lang.org/stable/book/ch11-00-testing.html). 

One of the advantages of this approach is that tests can save us a lot of effort to deal with UI and io 
so we can focus studying rust as libraries.

A command way to start a new crate for this purpose is something like

```
cargo new --lib rust-tests
```

This is going to be our objectives in the coming days.

{{#include rust-tests/README.md}}

