/**
 *
 */

import 'dart:math';

main(List<String> args) {

  const int TARGET = 1000;

  int a = 1;
  int b = 2;
  int c = 3;

  bool found = false;

  while (a < TARGET && !found) {

    while (b < TARGET && !found){

      while (c < TARGET && !found) {

        int value = a +  b  + c;

        if (value == TARGET) {

          if ((pow(a, 2) + pow(b, 2)) == pow(c, 2)) {
            found = true;
          }
        }
         c++;
      }
      b++;
    }
    a++;
  }

  if (found) {
    print('Answer, $a, $b, $c');
  } else {
    print('Not Found!');
  }

}