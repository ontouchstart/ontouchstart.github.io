`make test`

`tests/example-fuzzy-query.rs`
```rust
/// https://docs.rs/fst/latest/fst/#example-fuzzy-query
///
use fst::automaton::Levenshtein;
use fst::{IntoStreamer, Set};

#[test]
fn example_fuzzy_query() -> Result<(), Box<dyn std::error::Error>> {
    // A convenient way to create sets in memory.
    let keys = vec!["fa", "fo", "fob", "focus", "foo", "food", "foul"];
    let set = Set::from_iter(keys)?;

    // Build our fuzzy query.
    let lev = Levenshtein::new("foo", 1)?;

    // Apply our fuzzy query to the set we built.
    let stream = set.search(lev).into_stream();

    let keys = stream.into_strs()?;
    assert_eq!(keys, vec!["fo", "fob", "foo", "food"]);
    Ok(())
}
```

`tests/example-searching-multiple-sets-efficiently.rs`
```rust
/// https://docs.rs/fst/latest/fst/#example-searching-multiple-sets-efficiently
use fst::automaton::{Automaton, Str};
use fst::set;
use fst::{Set, Streamer};

#[test]
fn example_searching_multiple_sets_efficiently() -> Result<(), Box<dyn std::error::Error>> {
    let set1 = Set::from_iter(&["AC/DC", "Aerosmith"])?;
    let set2 = Set::from_iter(&["Bob Seger", "Bruce Springsteen"])?;
    let set3 = Set::from_iter(&["George Thorogood", "Golden Earring"])?;
    let set4 = Set::from_iter(&["Kansas"])?;
    let set5 = Set::from_iter(&["Metallica"])?;

    // Create the matcher. We can reuse it to search all of the sets.
    let matcher = Str::new("B")
        .starts_with()
        .union(Str::new("G").starts_with());

    // Build a set operation. All we need to do is add a search result stream
    // for each set and ask for the union. (Other operations, like intersection
    // and difference are also available.)
    let mut stream = set::OpBuilder::new()
        .add(set1.search(&matcher))
        .add(set2.search(&matcher))
        .add(set3.search(&matcher))
        .add(set4.search(&matcher))
        .add(set5.search(&matcher))
        .union();

    // Now collect all of the keys. Alternatively, you could build another set
    // here using `SetBuilder::extend_stream`.
    let mut keys = vec![];
    while let Some(key) = stream.next() {
        keys.push(String::from_utf8(key.to_vec())?);
    }
    assert_eq!(
        keys,
        vec![
            "Bob Seger",
            "Bruce Springsteen",
            "George Thorogood",
            "Golden Earring",
        ]
    );
    Ok(())
}
```bash
cargo test

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s


running 1 test
test example_fuzzy_query ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s


running 1 test
test example_searching_multiple_sets_efficiently ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.01s

```
# python

`main.py`
```python
def main():
    print("Hello from notebook-2026-01-07!")


def test_main():
    assert True


if __name__ == "__main__":
    main()
```
```bash
uv run pytest main.py -v
============================= test session starts ==============================
platform darwin -- Python 3.14.2, pytest-9.0.2, pluggy-1.6.0 -- /Users/sam/github/ontouchstart.github.io/rust-notebook/.venv/bin/python3
cachedir: .pytest_cache
rootdir: /Users/sam/github/ontouchstart.github.io/rust-notebook/src/2026/01/07
configfile: pyproject.toml
collecting ... collected 1 item

main.py::test_main PASSED                                                [100%]

============================== 1 passed in 0.00s ===============================
```
