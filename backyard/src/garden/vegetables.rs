///
/// ```
/// let plant = backyard::Asparagus {};
/// ```
///
/// ```compile_fail
/// let plant = Asparagus {};
/// ```
///
/// ```compile_fail
/// let plant = vegetables::Asparagus {};
/// ```
///
/// ```compile_fail
/// let plant = garden::vegetables::Asparagus {};
/// ```
///
#[derive(Debug)]
pub struct Asparagus {}
