/**
 *
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */

import 'dart:math';

/**
 * Entry to Sieve.
 *
 */
class Entry {
  int value;
  bool marked;

  Entry(this.value, this.marked);
}

/**
 * Sieve.
 *
 */
class SieveOfEratosthenes {
  List sieve = [];

  /**
   * Constructor.
   */
  SieveOfEratosthenes(int size) {
    init(size);
  }

  void init(int size) {
    // Fill sieve with 1..n unmarked
    for (int i = 0; i < size; i++) {
      Entry entry = new Entry(i + 1, false);
      sieve.add(entry);
    }
  }

  void mark(int prime) {
    int len = sieve.length;
    int index = prime - 1;

    while (index < len) {
      index = index + prime;
      if (index < len) {
        sieve[index].marked = true;
      }
    }
  }

  /**
   * Find next prime
   *
   */
  int findNextPrime(int prime) {

    mark(prime);

    int nextPrime = -1;
    bool found = false;
    int index = prime;

    while (!found && index < sieve.length) {

      if (!sieve[index].marked) {
        nextPrime = sieve[index].value;
        found = true;
      } else
        index++;
    }

    return nextPrime;
  }

}

/**
 * Main function
 */
main(List<String> args) {

  // Lets round up m/ln(n) limit for primes < 2000000
  const int MAX_VALUES = 2000003;
  const int MAX_PRIME = 2000000;
  const int START_PRIME = 2;

  SieveOfEratosthenes sieveOfEratosthenes = new SieveOfEratosthenes(MAX_VALUES);

  int sum = 2;

  int count = 0;
  int prime = START_PRIME;
  while (count < MAX_VALUES && prime < MAX_PRIME) {

    prime = sieveOfEratosthenes.findNextPrime(prime);

    if (prime != -1) {
      print('[${count + 1}] Prime : $prime');

      sum += prime;

      count++;
    }
  }

  print('Result $sum');
}

