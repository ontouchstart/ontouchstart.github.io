#[cfg(test)]
mod tests {
    #[test]
    fn vec_enum() {
        let v = vec![
            ontouchstart_2026_01_13_rs::SpreadsheetCell::Int(3),
            ontouchstart_2026_01_13_rs::SpreadsheetCell::Text(String::from("blue")),
            ontouchstart_2026_01_13_rs::SpreadsheetCell::Float(10.12),
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
}
