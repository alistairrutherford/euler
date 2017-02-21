/**
 *
    Special Pythagorean triplet
    Problem 9
    A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

    a2 + b2 = c2
    For example, 32 + 42 = 9 + 16 = 25 = 52.

    There exists exactly one Pythagorean triplet for which a + b + c = 1000.
    Find the product abc.
 */

import 'dart:math';

main(List<String> args) {

  const int TARGET = 1000;

  bool found = false;

  int a = 1;
  int b = 2;
  int c = 3;
  while (a < TARGET && !found) {
    b = 2;

    while (b < TARGET && !found){

      c = TARGET - a - b;

      if ((pow(a, 2) + pow(b, 2)) == pow(c, 2)) {
        found = true;
      }
      else
        b++;
    }

    if (!found) {
      a++;
    }
  }

  if (found) {
    print('Answer, $a, $b, $c, Product =${ a * b * c}');
  } else {
    print('Not Found!');
  }

}