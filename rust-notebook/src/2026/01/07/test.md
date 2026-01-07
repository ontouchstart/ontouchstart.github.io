cargo fmt
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
```
```bash
cargo test
    Finished `test` profile [unoptimized + debuginfo] target(s) in 0.01s
     Running unittests src/lib.rs (target/debug/deps/notebook_2026_01_07-92c4db99aab404bc)

running 1 test
test tests::internal ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running unittests src/main.rs (target/debug/deps/notebook_2026_01_07-53c4b8ffd2738b9e)

running 1 test
test test_main ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running tests/example-fuzzy-query.rs (target/debug/deps/example_fuzzy_query-9913658f3eefeec9)

running 1 test
test example_fuzzy_query ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running tests/example-searching-multiple-sets-efficiently.rs (target/debug/deps/example_searching_multiple_sets_efficiently-df86a94400e22778)

running 1 test
test example_searching_multiple_sets_efficiently ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.01s

     Running tests/integration_test.rs (target/debug/deps/integration_test-1dd791e0f222d3ee)

running 1 test
test it_adds_two ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

   Doc-tests notebook_2026_01_07

running 1 test
test src/lib.rs - add_two (line 3) ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

```
