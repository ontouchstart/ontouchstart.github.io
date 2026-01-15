pub fn build_vector() -> Vec<i16> {
    let mut v = Vec::<i16>::new();
    v.push(10);
    v.push(20);
    v
}

#[test]
fn test_build_vector() {
    assert_eq!(build_vector(), vec![10, 20]);
}
