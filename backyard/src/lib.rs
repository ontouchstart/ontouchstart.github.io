/// https://doc.rust-lang.org/stable/book/ch07-02-defining-modules-to-control-scope-and-privacy.html
///
/// ```compile_fail
/// let plant = garden::vegetables::Asparagus {};
/// ```
///
///
/// ```compile_fail
/// let plant = backyard::garden::vegetables::Asparagus {};
/// ```
///
///
/// ```
/// let plant = backyard::Asparagus {};
/// ```
///
mod garden;

pub use garden::vegetables::Asparagus;
