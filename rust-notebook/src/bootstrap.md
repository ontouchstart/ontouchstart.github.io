# Bootstrap

## Install mdbook locally

```
cargo install mdbook --root .cargo
```

## Create a book

[Official doc](https://rust-lang.github.io/mdBook/guide/creating.html)


### Initializing a book
```
.cargo/bin/mdbook init rust-notebook
```

### Start a local webserver
```
cd rust-notebook
../.cargo/bin/mdbook serve --open
```

### Publishing a book
```
cd rust-notebook
../.cargo/bin/mdbook build
```
