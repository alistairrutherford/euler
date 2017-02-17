/**
 * What is the 10001st prime number
 *
 * Solution uses: Sieve of Eratosthenes
 */


/**
 * Represents entry to Sieve.
 *
 */
class Entry {
  int value;
  bool marked;

  Entry(this.value, this.marked);
}

/**
 * Build array of entries
 *
 */
List initialiseValues(int max) {

  var  values = [];

  for (int i = 0; i < max; i++) {
    Entry entry = new Entry(i + 1, false);
    values.add(entry);
  }

  return values;
}

/**
 * Mark multiples of current prime.
 *
 */
void markEntries(int p, List entries) {

  int index = p - 1;
  while (index < entries.length) {
    index = index + p;
    if (index < entries.length) {
      entries[index].marked = true;
    }
  }

}

/**
 * Find next prime
 */
int findNextPrime(int p, List entries) {

  int prime = -1;
  bool found = false;
  int index = p ;

  while (!found && index < entries.length) {

    if (!entries[index].marked) {
      prime = entries[index].value;
      found = true;
    } else
      index++;
  }

  return prime;
}

/**
 * Main function
 */
main(List<String> args) {

  const int MAX_VALUES = 999999;
  const int MAX_COUNT = 10000; // Exclude the 2

  /**
   * Sieve of Eratosthenes
   */

  var entries = initialiseValues(MAX_VALUES);

  int count = 0;
  int prime = 2;
  while (count < MAX_COUNT) {
    markEntries(prime, entries);

    prime = findNextPrime(prime, entries);
    if (prime != -1) {
      print('[${count + 1}] Prime : $prime');
      count++;
    }
  }

}

