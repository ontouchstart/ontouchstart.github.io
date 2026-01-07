cargo fmt
`make test`

`src/main.rs`
```rust
fn main() {
    println!("Hello, world!");
}

#[test]
fn test_main() {
    assert_eq!(1, 1);
}
```

`src/lib.rs`
```rust
/// ```
///  let result = notebook_2026_01_07::add_two(2);
///  assert_eq!(result, 4);
/// ```

pub fn add_two(a: u64) -> u64 {
    internal_adder(a, 2)
}

fn internal_adder(left: u64, right: u64) -> u64 {
    left + right
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn internal() {
        let result = internal_adder(2, 2);
        assert_eq!(result, 4);
    }
}
```

`tests/integration_test.rs`
```rust
#[test]
fn it_adds_two() {
    let result = notebook_2026_01_07::add_two(2);
    assert_eq!(result, 4);
}
```

`tests/fst-test.rs`
```rust
// Based on
// https://github.com/BurntSushi/fst/blob/master/tests/test.rs
// with modifications to make it work here

use fst::automaton::Levenshtein;
use fst::automaton::{Str, Subsequence};
use fst::raw::{Builder, Fst};
use fst::set::Set;
use fst::{self, Automaton, IntoStreamer, Streamer};

static WORDS: &'static str = include_str!("../data/words-10000");

fn get_set() -> Set<Vec<u8>> {
    Set::from_iter(WORDS.lines()).unwrap()
}

fn fst_set<I, S>(ss: I) -> Fst<Vec<u8>>
where
    I: IntoIterator<Item = S>,
    S: AsRef<[u8]>,
{
    let mut bfst = Builder::memory();
    let mut ss: Vec<Vec<u8>> = ss.into_iter().map(|s| s.as_ref().to_vec()).collect();
    ss.sort();
    for s in ss.iter().into_iter() {
        bfst.add(s).unwrap();
    }
    let fst = bfst.into_fst();
    ss.dedup();
    assert_eq!(fst.len(), ss.len());
    fst
}

#[test]
fn levenshtein_simple() {
    let set = fst_set(vec!["woof", "wood", "banana"]);
    let q = Levenshtein::new("woog", 1).unwrap();
    let vs = set.search(&q).into_stream().into_byte_keys();
    assert_eq!(vs, vec!["wood".as_bytes(), "woof".as_bytes()]);
}

#[test]
fn levenshtein_unicode() {
    let set = fst_set(vec!["woof", "wood", "banana", "☃snowman☃"]);
    let q = Levenshtein::new("snoman", 3).unwrap();
    let vs = set.search(&q).into_stream().into_byte_keys();
    assert_eq!(vs, vec!["☃snowman☃".as_bytes()]);
}

#[test]
fn complement_small() {
    let keys = vec!["fa", "fo", "fob", "focus", "foo", "food", "foul"];
    let set = Set::from_iter(keys).unwrap();
    let lev = Levenshtein::new("foo", 1).unwrap();
    let stream = set.search(lev.complement()).into_stream();

    let keys = stream.into_strs().unwrap();
    assert_eq!(keys, vec!["fa", "focus", "foul"]);
}

#[test]
fn startswith_small() {
    let keys = vec![
        "", "cooing", "fa", "fo", "fob", "focus", "foo", "food", "foul", "fritter", "frothing",
    ];
    let set = Set::from_iter(keys).unwrap();
    let lev = Levenshtein::new("foo", 1).unwrap();
    let stream = set.search(lev.starts_with()).into_stream();

    let keys = stream.into_strs().unwrap();
    assert_eq!(
        keys,
        vec![
            "cooing", "fo", "fob", "focus", "foo", "food", "foul", "frothing",
        ]
    );
}

#[test]
fn intersection_small() {
    let keys = vec!["fab", "fo", "fob", "focus", "foo", "food", "foul", "goo"];
    let set = Set::from_iter(keys).unwrap();
    let lev = Levenshtein::new("foo", 1).unwrap();
    let prefix = Str::new("fo").starts_with();
    let stream = set.search(lev.intersection(prefix)).into_stream();

    let keys = stream.into_strs().unwrap();
    assert_eq!(keys, vec!["fo", "fob", "foo", "food"]);
}

#[test]
fn union_small() {
    let keys = vec!["fab", "fob", "focus", "foo", "food", "goo"];
    let set = Set::from_iter(keys).unwrap();
    let lev = Levenshtein::new("foo", 1).unwrap();
    let prefix = Str::new("fo").starts_with();
    let stream = set.search(lev.union(prefix)).into_stream();

    let keys = stream.into_strs().unwrap();
    assert_eq!(keys, vec!["fob", "focus", "foo", "food", "goo"]);
}

#[test]
fn intersection_large() {
    use fst::set::OpBuilder;

    let set = get_set();
    let lev = Levenshtein::new("foo", 3).unwrap();
    let prefix = Str::new("fa").starts_with();
    let mut stream1 = set.search((&lev).intersection(&prefix)).into_stream();
    let mut stream2 = OpBuilder::new()
        .add(set.search(&lev))
        .add(set.search(&prefix))
        .intersection();
    while let Some(key1) = stream1.next() {
        assert_eq!(stream2.next(), Some(key1));
    }
    assert_eq!(stream2.next(), None);
}

#[test]
fn union_large() {
    use fst::set::OpBuilder;

    let set = get_set();
    let lev = Levenshtein::new("foo", 3).unwrap();
    let prefix = Str::new("fa").starts_with();
    let mut stream1 = set.search((&lev).union(&prefix)).into_stream();
    let mut stream2 = OpBuilder::new()
        .add(set.search(&lev))
        .add(set.search(&prefix))
        .union();
    while let Some(key1) = stream1.next() {
        assert_eq!(stream2.next(), Some(key1));
    }
    assert_eq!(stream2.next(), None);
}

#[test]
fn str() {
    let set = get_set();

    let exact = Str::new("vatican");
    let mut stream = set.search(&exact).into_stream();
    assert_eq!(stream.next().unwrap(), b"vatican");
    assert_eq!(stream.next(), None);

    let exact_mismatch = Str::new("abracadabra");
    let mut stream = set.search(&exact_mismatch).into_stream();
    assert_eq!(stream.next(), None);

    let starts_with = Str::new("vati").starts_with();
    let mut stream = set.search(&starts_with).into_stream();
    assert_eq!(stream.next().unwrap(), b"vatican");
    assert_eq!(stream.next().unwrap(), b"vation");
    assert_eq!(stream.next(), None);
}

#[test]
fn subsequence() {
    let set = get_set();
    let subseq = Subsequence::new("nockbunsurrundd");

    let mut stream = set.search(&subseq).into_stream();
    assert_eq!(stream.next().unwrap(), b"bannockburnsurrounded");
    assert_eq!(stream.next(), None);
}

#[test]
fn implements_default() {
    let map: fst::Map<Vec<u8>> = Default::default();
    assert!(map.is_empty());

    let set: fst::Set<Vec<u8>> = Default::default();
    assert!(set.is_empty());
}
```

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
   Compiling notebook_2026_01_07 v0.1.0 (/Users/sam/github/ontouchstart.github.io/rust-notebook/src/2026/01/07)
    Finished `test` profile [unoptimized + debuginfo] target(s) in 2.33s
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

     Running tests/fst-test.rs (target/debug/deps/fst_test-e526e6ea798b23a5)

running 11 tests
test complement_small ... ok
test intersection_small ... ok
test startswith_small ... ok
test levenshtein_simple ... ok
test implements_default ... ok
test union_small ... ok
test levenshtein_unicode ... ok
test str ... ok
test intersection_large ... ok
test union_large ... ok
test subsequence ... ok

test result: ok. 11 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.09s

     Running tests/integration_test.rs (target/debug/deps/integration_test-1dd791e0f222d3ee)

running 1 test
test it_adds_two ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

   Doc-tests notebook_2026_01_07

running 1 test
test src/lib.rs - add_two (line 1) ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

```
