use docx_lite::extract_text;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let text = extract_text("resume.docx")?;
    println!("{}", text);
    Ok(())
}
