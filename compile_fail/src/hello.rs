/// https://doc.rust-lang.org/stable/rustdoc/write-documentation/documentation-tests.html#attributes
///
/// ```compile_fail
/// url::url("abc"); // shouldn't compile!
/// ```
pub fn hello() {
    println!("{}", url::url());
}
