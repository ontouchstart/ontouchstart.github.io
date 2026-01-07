///
/// ```
/// assert_eq!(
///     ontouchstart_2026_01_07_rs::url(),
///     String::from("https://github.com/ontouchstart/ontouchstart.github.io/tree/2026_01_07_rs")
/// );
/// ```
///
pub fn url() -> String {
    format!(
        "{}/{}",
        "https://github.com/ontouchstart/ontouchstart.github.io/tree",
        branch()
    )
}

fn branch() -> String {
    String::from("2026_01_07_rs")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn internal() {
        assert_eq!(branch(), String::from("2026_01_07_rs"));
    }
}
