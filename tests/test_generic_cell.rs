#[cfg(test)]
mod tests {
    use ontouchstart_2026_01_13_rs::GenericCell;

    #[test]
    fn test_generic_cell_float() {
        let v = vec![
            GenericCell::Int(3),
            GenericCell::Text(String::from("blue")),
            GenericCell::Float(10.12),
        ];

        assert_eq!(
            format!("{:#?}", v.get(0)),
            "Some(\n    Int(\n        3,\n    ),\n)"
        );
        assert_eq!(
            format!("{:#?}", v.get(1)),
            "Some(\n    Text(\n        \"blue\",\n    ),\n)"
        );
        assert_eq!(
            format!("{:#?}", v.get(2)),
            "Some(\n    Float(\n        10.12,\n    ),\n)"
        );
        assert_eq!(format!("{:#?}", v.get(3)), "None");
    }

    #[test]
    fn test_generic_cell_string_float() {
        let v = vec![
            GenericCell::Int(3),
            GenericCell::Text(String::from("blue")),
            GenericCell::Float(String::from("10.12")),
        ];

        assert_eq!(
            format!("{:#?}", v.get(0)),
            "Some(\n    Int(\n        3,\n    ),\n)"
        );
        assert_eq!(
            format!("{:#?}", v.get(1)),
            "Some(\n    Text(\n        \"blue\",\n    ),\n)"
        );
        assert_eq!(
            format!("{:#?}", v.get(2)),
            "Some(\n    Float(\n        \"10.12\",\n    ),\n)"
        );
        assert_eq!(format!("{:#?}", v.get(3)), "None");
    }
}
