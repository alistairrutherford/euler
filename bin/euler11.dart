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

class GridProduct {

  int _maxCount;
  int _gridX;
  int _gridY;

  int _top;
  int _bottom;
  int _startLine;
  int _endLine;

  /**
   * Make grid
   *
   * @param maxCount The max digits to sum.
   * @param gridX Width in digit count.
   * @param gridY Height in digit count.
   */
  GridProduct(int maxCount, int gridX, int gridY) {
    this._maxCount = maxCount;
    this._gridX = gridX;
    this._gridY = gridY;

    // Not calculate a few limits
    _top = gridX * (maxCount-1);
    _bottom = (gridX * gridY) - (gridX * maxCount);
    _startLine = maxCount;
    _endLine = gridX - maxCount;
  }

  /**
   * Extract number as two digits from grid.
   *
   * @param index
   */
  int getNumber(int index) {

    int adjusted = index * 2;

    int value = int.parse(DIGITS[adjusted] + DIGITS[adjusted + 1]);

    return value;
  }

  int productRight(int index) {
    int product = 1;

    bool valid = (index <= _endLine) || ((index % _gridX) <= _endLine);

    if (valid) {
      for (int i = 0; i < _maxCount; i++) {
        int value = getNumber(index + i);
        product *= value;
      }
    }

    return product;
  }

  int productDown(int index) {
    int product = 1;

    if (index < _bottom) {
      for (int i = 0; i < _maxCount; i++) {
        int value = getNumber(index + (i * _gridX));
        product *= value;
      }
    }

    return product;
  }

  int productDiagonalForward(int index) {
    int product = 1;

    bool valid = ((index < _bottom) && (index <= _endLine)) ||
        ((index < _bottom) && ((index % _gridX) <= _endLine));

    if (valid) {
      for (int i = 0; i < _maxCount; i++) {
        int value = getNumber(index + (i * _gridX) + i);

        product *= value;
      }
    }

    return product;
  }

  int productDiagonalBackward(int index) {
    int product = 1;

    bool valid = ((index < _bottom) && (index >=_startLine)) ||
        ((index < _bottom) && ((index % _gridX) >= _startLine));

    if (valid) {
      for (int i = 0; i < _maxCount; i++) {
        int value = getNumber(index + (i * _gridX) - i);
        product *= value;
      }
    }

    return product;
  }

}

int setMax(int value, int max) {
  int maxValue = max;

  if (value > max) {
    maxValue = value;
  }

  return maxValue;
}

main(List<String> args) {

  const int MAX_COUNT = 4;
  const int GRID_X = 20;
  const int GRID_Y = 20;

  GridProduct gridProduct = new GridProduct(MAX_COUNT, GRID_X, GRID_Y);

  int length = DIGITS.length ~/ 2;

  int max = 0;

  for (int index = 0; index < length; index++) {

    // right
    int value = gridProduct.productRight(index);

    max = setMax(value, max);

    // down
    value = gridProduct.productDown(index);

    max = setMax(value, max);

    // diagonal
    value = gridProduct.productDiagonalForward(index);

    max = setMax(value, max);

    // diagonal
    value = gridProduct.productDiagonalBackward(index);

    max = setMax(value, max);

  }

  print('Result is $max');
}