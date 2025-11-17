// src/lib.rs
use std::os::raw::c_char;
use std::ffi::CString;

/// A very small “Hello, world!” routine that returns a C string.
///
/// The function is exported with a C ABI and no name mangling so that
/// Python (or any other language) can find it by name.
#[no_mangle]
pub extern "C" fn hello() -> *const c_char {
    // A static string is fine – it lives for the whole program.
    // We convert it to a C string (null‑terminated) and return a raw pointer.
    let s = CString::new("Hello, world!").expect("CString::new failed");
    // Leak the CString so the memory stays valid after the function returns.
    // In a real program you would provide a matching `free` function.
    let ptr = s.into_raw();
    println!("allocate {:p}", ptr);
    return ptr;
}

/// Optional helper to free the string that `hello` returned.
///
/// This is not strictly needed for the demo, but it shows how you would
/// clean up memory that was allocated in Rust and handed to Python.
#[no_mangle]
pub extern "C" fn hello_free(ptr: *mut c_char) {
    println!("free {:p}", ptr);
    if ptr.is_null() { return; }
    unsafe {
        // Recreate the CString so Rust can drop it.
        let _ = CString::from_raw(ptr);
    }
}
