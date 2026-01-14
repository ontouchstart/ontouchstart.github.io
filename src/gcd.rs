pub fn gcd(mut n: usize, mut m: usize) -> usize {
    assert!(n != 0 && m != 0);
    while m != 0 {
        if m < n {
            // swap n and m
            let t = m;
            m = n;
            n = t;
        }
        m = m % n;
    }
    n
}

#[test]
fn test_gcd() {
    assert_eq!(gcd(2 * 3 * 4, 3 * 4 * 5), 3 * 4);
}

#[test]
#[should_panic]
fn test_gcd_panic() {
    assert_eq!(gcd(0, 0), 1);
}
