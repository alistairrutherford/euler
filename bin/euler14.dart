/**
 * Longest Collatz sequence
 * Problem 14
 * The following iterative sequence is defined for the set of positive integers:
 *
 * n → n/2 (n is even)
 * n → 3n + 1 (n is odd)
 *
 * Using the rule above and starting with 13, we generate the following sequence:
 *
 * 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 * It can be seen that this sequence (starting at 13 and finishing at 1) contains
 * 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
 * that all starting numbers finish at 1.
 *
 * Which starting number, under one million, produces the longest chain?
 *
 */

main(List<String> args) {
  const int MAX = 1000000;

  // Build every chain
  int value = 13;
  int maxChain = 0;
  int maxStarting = 0;
  while (value < MAX) {
    int chain = runChain(value, MAX);

    if (chain > maxChain) {
      maxChain = chain;
      maxStarting = value;
    }

    value++;
  }

  print('Starting: $maxStarting, Chain length: $maxChain');
}

/**
 * Run chain with limit number of turns.
 *
 */
int runChain(int starting, int limit) {
  bool complete = false;

  int current = starting;

  int index = 0;

  while (!complete && index < limit) {

    if (current % 2 ==0) {
      // Even
      current = current ~/ 2;
    }
    else {
      // Odd
      current = (3 * current) + 1;
    }

    if (current <= 1) {
      complete = true;
    }

    index ++;
  }

  return index;
}

