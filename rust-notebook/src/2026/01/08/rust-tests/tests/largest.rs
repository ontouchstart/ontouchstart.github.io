#[test]
fn test_largest() {
    let number_list = vec![34, 50, 25, 100, 65];

    let result = rust_tests::largest(&number_list);
    assert_eq!(*result, 100);

    let number_list = vec![102, 34, 6000, 89, 54, 2, 43, 8];

    let result = rust_tests::largest(&number_list);
    assert_eq!(*result, 6000);
}
