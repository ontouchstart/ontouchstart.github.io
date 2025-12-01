/* main.cpp
 *
 * Sum all prime numbers less than 1024.
 * Compile with:  g++ -std=c++17 -O2 -Wall main.cpp -o prime_sum
 */
#include <iostream>
#include <vector>
#include <cmath>

int main() {
    const int LIMIT = 1024;                     // we want primes < 1024
    std::vector<bool> isPrime(LIMIT, true);     // initially assume every number is prime

    // 0 and 1 are not primes
    if (LIMIT > 0) isPrime[0] = false;
    if (LIMIT > 1) isPrime[1] = false;

    // Sieve of Eratosthenes
    for (int p = 2; p * p < LIMIT; ++p) {
        if (isPrime[p]) {
            for (int multiple = p * p; multiple < LIMIT; multiple += p)
                isPrime[multiple] = false;
        }
    }

    // Sum all primes < 1024
    long long sum = 0;
    for (int i = 2; i < LIMIT; ++i) {
        if (isPrime[i]) sum += i;
    }

    std::cout << "Sum of all prime numbers less than 1024: " << sum << '\n';
    return 0;
}
