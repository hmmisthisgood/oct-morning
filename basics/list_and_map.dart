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
  final String john = names[1];

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

  int length = names.length;

  Set<int> rollNumbers = {1, 1, 1, 1, 1, 12, 2, 4};
  print(rollNumbers);

  /// Map

  Map person = {
    "name": "Jack", //KV pair
    "age": 100,
    "bio": "this is bio",
  };
  final userBio = person["bio"];

  print(userBio);
  person['address'] = "Kathmandu";
  print(userBio);
  print(person);
}


/// List
/// Map : Simliar to JS object, Java's HashMap, python's Dictionary
/// Map has: Key/Value pair
/// Set