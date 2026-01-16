#[test]
fn string_literals() {
    assert_eq!("\"Ouch!\" said the well.", r#""Ouch!" said the well."#);

    let multiline_string = "In the room the women come and go,
        Singing of Mount Abora";

    assert_eq!(
        multiline_string,
        "In the room the women come and go,\n        Singing of Mount Abora"
    );

    let multiline_string = "In the room the women come and go,\
        Singing of Mount Abora";

    assert_eq!(
        multiline_string,
        "In the room the women come and go,Singing of Mount Abora"
    );

    let multiline_string = "It was a bright, cold day in April, and \
        there were four of us-\
        more or less.";

    assert_eq!(
        multiline_string,
        "It was a bright, cold day in April, and there were four of us-more or less."
    );
}
