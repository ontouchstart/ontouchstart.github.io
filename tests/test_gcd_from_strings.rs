use ontouchstart_2026_01_14_rs::gcd_from_strings;

#[test]
fn test_gcd_from_strings() {
    assert_eq!(gcd_from_strings(["2"].to_vec()), 2);
    assert_eq!(
        gcd_from_strings(["30", "105"].to_vec()),
        15
    );
    assert_eq!(
        gcd_from_strings(["30", "105", "385"].to_vec()),
        5
    );
}

#[test]
#[should_panic]
fn test_gcd_from_empty_strings_panic() {
 let empty_strings = Vec::<&str>::new();
    gcd_from_strings(empty_strings);
}

#[test]
#[should_panic]
fn test_gcd_from_0_strings_panic() {
    gcd_from_strings(["0"].to_vec());
    gcd_from_strings(["1", "0"].to_vec());
}

#[test]
#[should_panic]
fn test_gcd_from_invalid_strings_panic() {
    gcd_from_strings(["A", "1"].to_vec());
    gcd_from_strings(["1.5"].to_vec());
    gcd_from_strings(["-1"].to_vec());
}
