/**
Find sum of even numbers in fibonnaci sequence.
*/
void main() {
  int first = 1;
  int second = 2;
  int UPPER_LIMIT = 4000000;

  int sum = 2;
  
  bool finished = false;
  while (!finished) {
    int next = first + second;
    
    if (next > UPPER_LIMIT) {
      finished = true;
    } else {

      // If even the add to total
      if (next % 2 == 0) {
        sum += next;
      }

      // print('$next');
      
      first = second;
      second = next;
    }
	}
  
  print ("Answer is $sum");
  
}
