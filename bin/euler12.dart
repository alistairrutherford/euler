/**
 * What is the value of the first triangle number to have over five hundred divisors?
 *
 */
import 'dart:math';

main(List<String> args) {
  const int FACTOR_TARGET = 500;

  bool found = false;
  int index = 1;
  int answer = -1;

  while (!found) {
    // Find triangle number total.
    int total = (index * (index + 1)) ~/ 2;

    int factorCount = 1;

    int limit = sqrt(total).toInt();

    // For each possible factor up to square root of N.
    for (int factor = 2; factor <= limit; factor++) {

      if (total % factor == 0) {
        factorCount +=2;
      }
    }

    print('Total : $total, Factor count: $factorCount');

    if (factorCount >= FACTOR_TARGET) {
      found = true;
      answer = total;
    } else {
      index++;
    }

  }

  print('Result is $answer');
}