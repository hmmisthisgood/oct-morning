/// abstraction
/// inheritence
/// encapsulation
/// polymorphism

// class
// static
// this
// super
// extends

class User {
  /// there is always a default constructor function

  // User() {}

  User(
      {this.bio,
      required this.username,
      required this.age,
      required this.id,
      String? privateInfo})
      : _privateInfo = privateInfo;

  // User(String bio, String username, int age, int id) {
  //   this.bio = bio;
  //   this.username = username;
  // }

  /// properties   : class variables

  static String countryName = "Nepal";

  String? bio;
  String username;
  int age;
  // int? age; it is nullable
  int id;

  String? _privateInfo;

  //// getter/ setter

  /// old way of creating getter
  String? getPrivateInfo() {
    return _privateInfo;
  }

  String? get privateInfo => _privateInfo;

  set privateInfo(String? newValue) {
    _privateInfo = newValue;
  }

  void setPrivateInfo(String? newValue) {
    _privateInfo = newValue;
  }

  /// actions/functions  : methods

  createPost() {
    print("${this.username}  created a post");
  }

  like() {
    print("$username like +1");
  }
}

main() {
  // var adam = User();

  // User john = User();

  User adam = new User(
      bio: "I am my bio",
      username: "IAm_admin",
      age: 25,
      id: 12312,
      privateInfo: "This is supposed to be private");

  User jeff = User(username: "Jefffff", age: 20, id: 1232);

  adam.like();
  adam.createPost();
  String? adamPrivateInfo = adam.getPrivateInfo();
  adamPrivateInfo = adam.privateInfo;

  /// using the setters
  adam.privateInfo = "This is the new secret";
  adam.setPrivateInfo("private info");

  jeff.age = 100;
  jeff.username = "not_jeff";

  jeff.like();
  jeff.createPost();

  User.countryName = "China";
  User.countryName = "India";
}
