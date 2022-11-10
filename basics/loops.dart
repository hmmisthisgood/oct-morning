main() {
  /// for
  List<String> names = [
    "Jeff",
    "Jeff",
    "Jeff",
    "Some Name",
    "John",
    "Jessica",
    "Ram",
    "Jack"
  ];

  /// 8

  /// Normal for loop
  int count = 0;

  // for (int i = 0; i < 100; i++) {
  //   print(i);
  // }

  // loop with list
  for (count; count < names.length; count++) {
    print(count);

    if (count == 3) {
      continue;
    }

    if (count == 5) {
      break;
    }

    final name = names[count];
    print("$count. My name is $name.");
  }

  /// for in loop

  for (String abc in names) {
    print(abc);
  }

  /// for each loop

  /// while
  int wCount = 0;
  while (wCount < 6) {
    print("looping with while");
    wCount++;
  }

  /// do whil

  do {
    print("looping with do while");
    wCount--;
  } while (wCount > 0);
}

/// for , while , do while


/// break
/// continue