```
cargo build --release
gcc test.c -Ltarget/release -lhello -o test
LD_LIBRARY_PATH=target/release ./test
allocate 0x102965b70
free 0x102965b70
C sees: Hello, world!
python3 call_hello.py
allocate 0x1022195d0
free 0x1022195d0
python allocate 0x1022195d0
Rust says: Hello, world!
```

[ref](https://docs.python.org/3/library/ctypes.html#c-char-p)
