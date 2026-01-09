fn main() -> Result<(), Box<dyn std::error::Error>> {
    // localhost:8080/v1/models -H "Content-Type: application/json"
    let body: String = ureq::get("http://localhost:8080/v1/models")
        .header("Content-Type", "application/json")
        .call()?
        .body_mut()
        .read_to_string()?;
    println!("{}", body);
    Ok(())
}
