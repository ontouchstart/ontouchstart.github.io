use docx_lite::extract_text_from_bytes;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let bytes = include_bytes!("resume.docx");
    let text = extract_text_from_bytes(bytes).unwrap();
    println!("{}", text);
    Ok(())
}
