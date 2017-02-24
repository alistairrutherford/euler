/**
 * What is the greatest product of four adjacent numbers in the same direction
 * (up, down, left, right, or diagonally) in the 20×20 grid?
 */

const String DIGITS = "0802229738150040007504050778521250779108"
                      "4949994017811857608717409843694804566200"
                      "8149317355791429937140675388300349133665"
                      "5270952304601142692468560132567137023691"
                      "2231167151676389419236542240402866331380"
                      "2447326099034502447533537836842035171250"
                      "3298812864236710263840675954706618386470"
                      "6726206802621220956394396308409166499421"
                      "2455580566739926971778789683148834896372"
                      "2136230975007644204535140061339734313395"
                      "7817532822753167159403800462161409535692"
                      "1639054296353147555888240017542436298557"
                      "8656004835718907054444374460215851541758"
                      "1980816805944769287392138652177704895540"
                      "0452088397359916079757321626267933279866"
                      "8836688757622072034633674655123263935369"
                      "0442167338253911249472180846293240627636"
                      "2069364172302388346299698267598574043616"
                      "2073352978319001743149714886811623570554"
                      "0170547183515469169233486143520189196748";

class GridSum {

  int _maxCount;
  int _gridX;
  int _gridY;

  int _top;
  int _bottom;
  int _startLine;
  int _endLine;

  GridSum(int maxCount, int gridX, int gridY) {
    this._maxCount = maxCount;
    this._gridX = gridX;
    this._gridY = gridY;

    // Not calculate a few limits
    _top = gridX * maxCount;
    _bottom = (gridX * gridY) - (gridX * maxCount);
    _startLine = maxCount;
    _endLine = gridX - maxCount;
  }

  int sumUp(int index) {
    int sum = 0;

    if (index > _top) {
      for (int i = 0; i < _maxCount; i++) {
        int value = int.parse(DIGITS[index - (i * _maxCount)]);
        sum += value;
      }
    }

    return sum;
  }

  int sumDown(int index) {
    int sum = 0;

    if (index < _bottom) {
      for (int i = 0; i < _maxCount; i++) {
        int value = int.parse(DIGITS[index + (i * _maxCount)]);
        sum += value;
      }
    }

    return sum;
  }

  int sumRight(int index) {
    int sum = 0;

    bool valid = (index < _endLine) || ((index > _gridX) && ((index % _gridX) < _endLine));

    if (valid) {
      for (int i = 0; i < _maxCount; i++) {
        int value = int.parse(DIGITS[index + i]);
        sum += value;
      }
    }

    return sum;
  }

  int sumLeft(int index) {
    int sum = 0;

    bool valid = (index > _startLine) || ((index > _gridX) && ((index % _gridX) > _startLine));

    if (valid) {
      for (int i = 0; i < _maxCount; i++) {
        int value = int.parse(DIGITS[index - i]);
        sum += value;
      }
    }

    return sum;
  }

  int sumDiagonal(int index) {
    int sum = 0;

    bool valid = ((index < _bottom) && (index < _endLine)) ||
                 ((index > _gridX) && ((index % _gridX) > _startLine));

    if (valid) {
      for (int i = 0; i < _maxCount; i++) {
        int value = int.parse(DIGITS[index + (i * _gridX)]);
        sum += value;
      }
    }

    return sum;
  }

}

main(List<String> args) {

  int MAX_COUNT = 4;
  int GRID_X = 20;
  int GRID_Y = 20;

  GridSum gridSum = new GridSum(MAX_COUNT, GRID_X, GRID_Y);

  int sum = 0;

  for (int index = 0; index < DIGITS.length; index++) {

    // Sum left
    sum += gridSum.sumLeft(index);

    // Sum right
    sum += gridSum.sumRight(index);

    // Sum up
    sum += gridSum.sumUp(index);

    // Sum down
    sum += gridSum.sumDown(index);

    // Sum diagonal
    sum += gridSum.sumDiagonal(index);
  }

  print('Result is $sum');
}