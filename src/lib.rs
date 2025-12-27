use pyo3::prelude::*;

/// A Python module implemented in Rust.
#[pymodule]
mod hello_maturin {
    use pyo3::prelude::*;

    /// Formats the sum of two numbers as string.
    #[pyfunction]
    fn sum_as_string(a: f32, b: f32) -> PyResult<String> {
        Ok((a + b).to_string())
    }
}
