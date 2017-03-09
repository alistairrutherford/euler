/**
 *  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
    What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

    Brute force method
 */
import 'dart:math';

/**
 * 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
 *
 */
main(List<String> args) {
  bool found = false;
  int limit = pow(2, 64);

  int current = 1;
  while (!found && current < limit) {

    int index = 2;
    bool failed = false;
    while (!failed && index <= 20) {
      int mod = current % index;
      if (mod != 0) {
        failed = true;
      } else {
        index++;
      }
    }

    if (!failed) {
      found = true;
    } else {
      current++;
    }
  }

  if (found) {
    print('Anser is $current');
  } else {
    print('Not found');
  }
}