pub fn build_vector() -> Vec<i16> {
    let mut v: Vec<i16> = Vec::<i16>::new();
    v.push(10i16);
    v.push(20i16);
    v
}

#[test]
fn test_build_vector() {
    assert_eq!(build_vector(), vec![10i16, 20i16]);
}
