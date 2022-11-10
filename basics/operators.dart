main() {
  /// For ex: a+b
  /// operators: a, b
  /// oprand: +

  int count = 0;

  /// arthemactic ooperators
  /// +, - , /. * , %
  /// unary operatopr: ++, -- , !negation
  int sum = 10 + 10;
  double diff = 10.0 - 10.0;

  // compariosn operators

  /// <, >, <=, >=, ==, !=
  bool isLarge = 5 > 3;
  print(isLarge);

//  logical operators,: && , ||, !
//  1<3<5

  bool isThreee = 3 > 1 || 3 > 5;

  count++; // suffix
  count--;
  ++count; //prefix
  --count;

  bool isWednesday = true;

  bool isNOtWed = !isWednesday;

  /// ternary operator
  ///   condition ? .... condition staisfy block... : ... condition fail block....

  (5 < 10) ? print("statisfied ") : print("falsified");
  var percent = 39;

  var examPassed = percent > 40
      ? "pass"
      // : 5 < 10
      //     ? "another condition"
      : "fail";
  print(examPassed);

  /// ?? , ?. , !
}
