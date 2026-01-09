pub fn url() -> String {
    format!(
        "{}/{}",
        "https://github.com/ontouchstart/ontouchstart.github.io/tree",
        branch::branch()
    )
}
