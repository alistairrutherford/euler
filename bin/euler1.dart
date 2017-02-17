void main() {
  int MAX = 1000;
  
  int total = 0;
  for (int i = 1; i < MAX; i++) {

  if ((i % 3 == 0) || (i % 5 == 0)) {
      print('Divisor = $i');
      // Divisible
      total = total + i;
    }

  }
  
  print('Answer is $total');
  
}
