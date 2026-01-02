use docx_lite::parse_document_from_path;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let doc = parse_document_from_path("src/ontouchstart/resume.docx")?;

    for paragraph in &doc.paragraphs {
        println!("{}", paragraph.to_text());
    }

    Ok(())
}
