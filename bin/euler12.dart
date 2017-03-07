/**
 * What is the value of the first triangle number to have over five hundred divisors?
 *
 */

import 'dart:math';

main(List<String> args) {
  const int FACTOR_TARGET = 500;

  int count = 0;

  bool found = false;

  int index = 1;
  while (!found) {
    int value = (index * (index + 1)) ~/ 2;

    int factorCount = 1;

    int limit = sqrt(value).toInt();

    for (int factor = index; factor < limit; factor++) {

      if (factor % factorCount == 0) {
        factorCount++;
      }
    }

    if (factorCount >= FACTOR_TARGET) {

    }
  }

  print('Result is $count');
}