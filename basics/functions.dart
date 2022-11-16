main() {
  final rectArea = areaOfRect(20, 50);

  divide(length: 100, breadth: 24);

  Function(int a, int b) myFunction = (a, b) {
    print(a * b);
  };
}

/// function definition for a function which calculates
/// area of rectangle
num areaOfRect(num breadth, num length) {
  final _a = length / breadth;
  return _a;
}

/// function with named arguments/parameters
void divide({required num breadth, required num length}) {
  final _a = length / breadth;
  print(_a);
}

// function with one line body . with => notation
int randomNumber() => 12;

// 3x+4y+90z=100
// void 
// =>