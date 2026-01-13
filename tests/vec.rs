#[cfg(test)]
mod tests {
    #[test]
    fn vec_new() {
        let v: Vec<i32> = Vec::new();
        assert_eq!(format!("{:#?}", v), "[]");
    }

    #[test]
    fn vec_macro() {
        let v = vec![1, 2, 3];
        assert_eq!(format!("{:#?}", v), "[\n    1,\n    2,\n    3,\n]");
    }

    #[test]
    fn vec_push() {
        let mut v = Vec::new();
        assert_eq!(format!("{:#?}", v), "[]");

        v.push(5);
        v.push(6);
        v.push(7);
        v.push(8);
        assert_eq!(format!("{:#?}", v), "[\n    5,\n    6,\n    7,\n    8,\n]");
    }

    #[test]
    fn vec_match() {
        let v = vec![1, 2, 3, 4, 5];

        let third: &i32 = &v[2];
        assert_eq!(third, &v[2]);

        let third: Option<&i32> = v.get(2);
        match third {
            Some(third) => assert_eq!(
                format!("The third element is {third}"),
                "The third element is 3"
            ),
            None => assert_eq!("no match", "no match"),
        }
    }

    #[test]
    fn vec_no_match() {
        let v = vec![1, 2, 3, 4, 5];

        let sixth: Option<&i32> = v.get(5);
        match sixth {
            Some(sixth) => assert_eq!(
                format!("The sixth element is {sixth}"),
                "The sixth element is 6"
            ),
            None => assert_eq!("no match", "no match"),
        }
    }
}
