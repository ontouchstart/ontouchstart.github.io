#!/usr/bin/env python3
import ctypes
import sys
import os

# Path to the compiled dylib
LIB_PATH = os.path.join(
    os.path.dirname(__file__),
    "target",
    "release",
    "libhello.dylib"  # or libhello_universal.dylib
)

# Load the library
hello_lib = ctypes.CDLL(LIB_PATH)

# Tell ctypes the signature of the functions
hello_lib.hello.restype = ctypes.c_void_p   # returns a *raw* pointer, not a string char*
hello_lib.hello_free.argtypes = [ctypes.c_void_p]
hello_lib.hello_free.restype = None

def main():
    # Call the Rust function
    raw = hello_lib.hello()

    print(f"python allocate {raw:#x}") 

    # Convert the C string to a Python str
    msg = ctypes.c_char_p(raw).value.decode('utf-8')
    print(f"Rust says: {msg}")

    # Clean up the memory that Rust allocated
    hello_lib.hello_free(raw)

if __name__ == "__main__":
    main()
