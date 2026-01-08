fn main() -> Result<(), Box<dyn std::error::Error>> {
   let send_body = "{\"model\": \"mlx-community/Llama-3.2-3B-Instruct-4bit\",\"messages\": [{\"role\": \"user\", \"content\": \"Tell me something about brown M&Ms\"}]}";

   let body: String = ureq::post("http://localhost:8080/v1/chat/completions")
    .header("Content-Type", "application/json")
    .send(send_body)?
    .body_mut()
    .read_to_string()?;
    println!("{}", body);
Ok(())
}

