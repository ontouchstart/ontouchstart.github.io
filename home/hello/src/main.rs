fn main() {
    println!("Hello, world!");
}


#[cfg(test)]
mod tests {
    #[test]
    fn true_true() {
        assert_eq!(true, true);
    }
}
