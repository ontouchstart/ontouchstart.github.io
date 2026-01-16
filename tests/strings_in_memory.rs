#[test]
fn strings_in_memory() {
    // String that owns an 8-byte buffer (pointer + data)
    let noodles = "noodles".to_string();
    assert_eq!(noodles.len(), 7);
    assert_eq!(noodles.chars().count(), 7);

    // &str ("stir" or "string slice", a fat pointer (address + length)
    let oodles = &noodles[1..];
    assert_eq!(oodles.len(), 6);
    assert_eq!(oodles.chars().count(), 6);

    // a string literal in the stack
    let poodles = "ಠ_ಠ";
    assert_eq!(poodles.len(), 7);
    assert_eq!(poodles.chars().count(), 3);
}
