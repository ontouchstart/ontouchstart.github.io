pub fn add(left: u64, right: u64) -> u64 {
    left + right
}

mod enums;

pub use enums::SpreadsheetCell;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }

    #[test]
    fn vec_enum() {
        let v = vec![
            SpreadsheetCell::Int(3),
            SpreadsheetCell::Text(String::from("blue")),
            SpreadsheetCell::Float(10.12),
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
