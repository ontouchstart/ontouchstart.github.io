// src/main.rs
fn main() {
    // Upper bound (exclusive)
    const LIMIT: usize = 1024;

    // Create a boolean vector where
    // `is_prime[i] == true` means that `i` is still considered prime
    let mut is_prime = vec![true; LIMIT];
    // 0 and 1 are not primes
    if LIMIT > 0 { is_prime[0] = false; }
    if LIMIT > 1 { is_prime[1] = false; }

    // Sieve of Eratosthenes
    let sqrt_limit = (LIMIT as f64).sqrt() as usize;
    for p in 2..=sqrt_limit {
        if is_prime[p] {
            // Mark all multiples of `p` as composite
            for multiple in (p * p..LIMIT).step_by(p) {
                is_prime[multiple] = false;
            }
        }
    }

    // Sum all indices that remained marked as prime
    let sum_of_primes: u64 = (2..LIMIT)
        .filter(|&i| is_prime[i])
        .map(|i| i as u64)
        .sum();

    println!(
        "The sum of all prime numbers less than {} is {}",
        LIMIT, sum_of_primes
    );
}
