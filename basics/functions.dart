int length = 1000;

main() {
  num rectArea = areaOfRect("", 0, 111);
  print(rectArea);

  /// this is a function call
  testResult();

  divide(length: 100, breadth: 24);
  namedFunc(
    breadth: 3243,
    length: 100,
  );

  Function(int a, int b) myFunction = (a, b) {
    print(a * b);
  };
}

/// function definition for a function which calculates
/// area of rectangle
///

testResult() {}

num areaOfRect(String test, num breadth, num length) {
  final _a = length / breadth; // 2*1 = 1*2
  print(_a);
  return _a;
}

namedFunc({
  required int length,
  required int breadth,
  String test = "",
}) {}

/// function with named arguments/parameters
void divide({required num breadth, required num length}) {
  num l, b;
  l = length;
  b = breadth;

  final _a = l / b;

  print(_a);
}

// function with one line body . with => notation
int randomNumber() => 12;

// 3x+4y+90z=100
// void
// =>
