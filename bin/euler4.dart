main(List<String> args) {

  int largest = 0;
  for (int i = 1; i <= 999; i++) {

    for (int j = 1; j <=999; j++) {

      int value = i * j;

      if (isPalindrome(value)) {
        print('Palindrome $value');
        if (value > largest) {
            largest = value;
        }
      }
    }
  }

  print('Answer is $largest');
}

/**
 * Test for palindrome.
 *
 */
bool isPalindrome(int value) {
  bool status  = false;

  int n = value;
  int reversed = 0;

  while (n >= 1) {
    int mod = n % 10;
    reversed = reversed * 10 + mod;
    n = (n / 10).toInt();
  }

  if (reversed == value) {
    status = true;
  }

  return status;
}