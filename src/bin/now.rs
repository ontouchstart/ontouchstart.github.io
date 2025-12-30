use pyo3::prelude::*;

fn main() -> PyResult<()> {
    Python::initialize();
    let from_python = Python::attach(|py| -> PyResult<Py<PyAny>> {
        let now: Py<PyAny> = PyModule::import(py, "datetime")?
            .getattr("datetime")?
            .getattr("now")?
            .into();
        now.call0(py)
    });
    println!("py: {}", from_python?);
    Ok(())
}
