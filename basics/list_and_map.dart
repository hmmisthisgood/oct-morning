main() {
  var emptyList = [];

  var randomList = ["Ram", "Sita", "Jeff", 1, 2, 3, 4];

  List<String> names = [
    "Jeff", //0
    "Jeff", //1
    "Jeff", //2
    "Some Name",
    "another" //4
        "John", //5
    "Jessica",
    "Ram",
    "Jack", // 7
  ];

  print(names);
  // position          0     , 1      , 2
  final String john = names[4];

  final last = names[4];

  final first = names[0];

  names.first;
  names.last;

  ///  data add
  names.add("Jeff");

  names.addAll(["A", "A"]);
  print(names);

  names.insert(0, "First name");
  print(names);

  names.map((e) => null);

  int length = names.length;

  names.toSet();

  Set<int> rollNumbers = {1, 1, 1, 1, 1, 12, 2, 4};
  print(rollNumbers);

  /// Map

  Map person = {
    "age": 100, // MapEntry
    "bio": "this is bio",

    "name": "Jack", //KV pair

    1233: [1, 2, 3],
    [1, 2]: 22,
    1: "2"
  };

  final personName = person['name'];

  final userBio = person["bio"];

  print(userBio);

  person['address'] = "Kathmandu";

  print(userBio);
  print(person);

  Map<String, String> item = {
    "price": "200",
    // 21: 2,
  };
  item['name'] = "Dell x11";
  print(item);

  final itemName = item["naaaaame"];

  MapEntry<String, String> discount = MapEntry("discount", "10%");

  item.addEntries([discount]);

  print(itemName);
}

/// Iterable

/// List
/// Map : Simliar to JS object, Java's HashMap, python's Dictionary
/// Map has: Key/Value pair
/// Set


/// 