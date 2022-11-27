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
  List<String> newNames = [];

  /// 8

  /// Normal for loop
  int count = 0;

  // for (int i = 0; i < 100; i++) {
  //   print(i);
  // }

  for (count; count < 5;) {
    print(count);
    count++;
  }

  // loop with list
  for (int count = 0; count < names.length; count++) {
    print(count);

    if (count == 3) {
      continue;
    }

    if (count == 5) {
      break;
    }

    ///count=0
    final name = names[count];
    final nn = " My name is $name.";
    print("$count. My name is $name.");
    newNames.add(nn);
  }

  // /// for in loop
  // for (String item in names) {
  //   /// perform some opeartions in list

  // }

  // for (String abc in names) {
  //   print('From for in : $abc');
  // }

  // /// for each loop

  // names.forEach(
  //   (item) {
  //     print(" Item from For Each: $item");
  //   },
  // );

  // names.forEach((name) {
  //   print(name);
  // });

  // /// while
  // int wCount = 0;
  // while (wCount < 6) {
  //   print("looping with while");
  //   wCount++;
  // }

  // /// do whil

  // do {
  //   print("looping with do while");
  //   wCount--;
  // } while (wCount > 0);

  // int npCount = 0;
  // while (npCount < 10) {
  //   print("Neepal");
  //   npCount++;
  // }
}

/// for , while , do while

/// break
/// continue
