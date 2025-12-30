use pyo3::prelude::*;

fn main() -> PyResult<()> {
    Python::initialize();
    Python::attach(|py| {
        let _ = PyModule::import(py, "this");
        Ok(())
    })
}
