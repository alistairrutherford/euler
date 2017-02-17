/**
 * What is the 10001st prime number
 * WIP
 */

import 'dart:math';

class Entry {
  int value;
  bool marked;

  Entry(value, marked);
}
main(List<String> args) {

  int MAX = 100;

  /**
   * Sieve of Eratosthenes
   */

  var enties = initialiseValues(MAX);

  // TODO

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