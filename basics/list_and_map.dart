main() {
  var emptyList = [];
  var randomList = ["Ram", "Sita", "Jeff", 1, 2, 3, 4];

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

  print(names);
  // position          0     , 1      , 2
  final String john = names[5];

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
    "name": "Jack", //KV pair
    "age": 100, // MapEntry
    "bio": "this is bio",
    1233: [1, 2, 3],
    [1, 2]: 22,
    1: "2"
  };
  final userBio = person["bio"];

  print(userBio);
  person['address'] = "Kathmandu";
  print(userBio);
  print(person);

  Map<String, String> item = {
    "price": "200",
  };
  item['name'] = "Dell x11";
  print(item);

  final itemName = item["name"];

  MapEntry<String, String> discount = MapEntry("discount", "10");
  item.addEntries([discount]);

  print(itemName);
}


/// Iterable

/// List
/// Map : Simliar to JS object, Java's HashMap, python's Dictionary
/// Map has: Key/Value pair
/// Set