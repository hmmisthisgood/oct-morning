/// abstraction
/// inheritence
/// encapsulation
/// polymorphism

// class
// static
// this
// super
// extends
// get/set
// override

class Person {
  /// constructor

  Person.personal({required this.age, required this.username});

  Person.named({this.age = 18, required this.username, String? password})
      : _password = password;

  /// attributes / or mmebers

  String username;
  int age;
  String? _password;

  /// actions/ methods

  void login() {
    print("${this.username} has logged in");
  }
}

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

  // String title, firstName, middleName, lastName;
  // String get fullname => "$title. $firstName $middleName $lastName";

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

  var private = adam.privateInfo;
  adam.privateInfo = "random private info****";
  adam.setPrivateInfo("");

  User jeff = User(username: "Jefffff", age: 20, id: 1232);

  adam.like();
  adam.createPost();
  String? adamPrivateInfo = adam.getPrivateInfo();

  adamPrivateInfo = adam.privateInfo;

  /// using the setters
  adam.privateInfo = "This is the new secret";
  adam.setPrivateInfo("private info");

  // jeff.fullname;

  jeff.age = 100;
  jeff.username = "not_jeff";

  jeff.like();
  jeff.createPost();

  User.countryName = "China";
  User.countryName = "India";

  Person someone =
      Person.named(age: 18, username: "iamJack", password: "strong password");

  someone.username = "I have a name";
  someone.age = 55;
  someone.login();
}
