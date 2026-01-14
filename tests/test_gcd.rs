use ontouchstart_2026_01_14_rs::gcd;

#[test]
fn test_gcd() {
    assert_eq!(gcd(14, 15), 1);
    assert_eq!(gcd(2 * 3 * 5 * 11 * 17, 3 * 7 * 11 * 13 * 19), 3 * 11);
}

#[test]
#[should_panic]
fn test_gcd_panic() {
    assert_eq!(gcd(0, 0), 1);
}
