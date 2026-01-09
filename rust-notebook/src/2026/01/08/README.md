# notebook_2026_01_08

For an experienced software engineer to learn a new programming language like [Rust](https://doc.rust-lang.org) 
and its ecosystem, before rushing into <https://crates.io> to grab anything that might get the job done, 
it would be a good idea to build a solid foundation by reading every page of
[The Rust Programming Language Book](https://doc.rust-lang.org/stable/book) and taking notes in the form of 
[test programs](https://doc.rust-lang.org/stable/book/ch11-00-testing.html) along the way.

One of the advantages of this approach is that tests can save us a lot of effort to deal with UI and io issues 
such as in production software (that is why we get paid, for our effort) 
so we can focus on studying the Rust ecosystem of 
[packages and crates](https://doc.rust-lang.org/stable/book/ch07-01-packages-and-crates.html)
in the way we want to explore.

[Integration tests](https://doc.rust-lang.org/stable/book/ch11-03-test-organization.html#integration-tests) 
is a great tool for this purpose.

A command to bootstrap a library crate without `src/main.rs` for this purpose is something like

```
cargo new --lib rust-tests
```

Again, the purpose of this page is about finding out **how** to learn Rust using tests. 
The actually learning will be much deeper in the coming days. 

{{#include rust-tests/README.md}}

