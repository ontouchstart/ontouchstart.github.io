# Bootstrap

## Install mdbook locally

```sh
cargo install mdbook --root .cargo
```

## Create a book

[Official doc](https://rust-lang.github.io/mdBook/guide/creating.html)


### Initializing a book

```sh
.cargo/bin/mdbook init rust-notebook
```

### Start a local webserver
```sh
cd rust-notebook
../.cargo/bin/mdbook serve --open
```

### Publishing a book
```sh
cd rust-notebook
../.cargo/bin/mdbook build
```
