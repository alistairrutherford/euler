/**
 * What is the 10001st prime number
 * WIP
 */

import 'dart:math';

/**
 * Represents entry to Sieve.
 *
 */
class Entry {
  int value;
  bool marked;

  Entry(value, marked);
}

/**
 * Build array of entries
 *
 */
List initialiseValues(int max) {

  var  values = [];

  for (int i = 0; i < max; i++) {
    Entry entry = new Entry(i + 1, false);

    values[i] = entry;
  }

  return values;
}

/**
 * Mark multiples of current prime.
 *
 */
void markEntries(int p, List entries) {

  int index = p;
  while (index < entries.length) {
    int target = index + p;
    entries[target].marked = true;
    index++;
  }

}

int findPrime(int p, List entries) {

  int prime = -1;
  bool found = false;
  int index = p;

  while (!found && p < entries.length) {

    if (!entries[index].marked) {
      prime = entries[index].value;
      found = true;
    }
  }

  return prime;
}

main(List<String> args) {

  int MAX = 100;

  /**
   * Sieve of Eratosthenes
   */

  var entries = initialiseValues(MAX);

  int prime = 2;
  bool finished = false;
  while (!finished) {
    markEntries(prime, entries);

    prime = findPrime(prime, entries);
    if (prime != -1) {
      print('Prime : $prime');
    } else {
      print('Done');
      finished = true;
    }
  }

}

