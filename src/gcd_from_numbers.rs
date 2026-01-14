use crate::gcd::gcd;

pub fn gcd_from_numbers(numbers: Vec<usize>) -> usize {
    assert!(numbers.len() > 0);
    let mut d = numbers[0];
    for m in &numbers[1..] {
        d = gcd(d, *m);
    }
    d
}

#[test]
fn test_gcd_from_numbers() {
    assert_eq!(gcd_from_numbers([2].to_vec()), 2);
    assert_eq!(
        gcd_from_numbers([2 * 3 * 5, 3 * 5 * 7].to_vec()),
        gcd(2 * 3 * 5, 3 * 5 * 7)
    );
    assert_eq!(
        gcd_from_numbers([2 * 3 * 5, 3 * 5 * 7, 5 * 7 * 11].to_vec()),
        5
    );
}

#[test]
#[should_panic]
fn test_gcd_from_empty_numbers_panic() {
    let empty_numbers = Vec::<usize>::new();
    gcd_from_numbers(empty_numbers);
}

#[test]
#[should_panic]
fn test_gcd_from_0_numbers_panic() {
    gcd_from_numbers([0].to_vec());
    gcd_from_numbers([1, 0].to_vec());
}
