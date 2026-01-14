pub fn add(left: u64, right: u64) -> u64 {
    left + right
}

mod enums;

pub use enums::GenericCell;
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
    fn test_spreadsheet_cell() {
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
