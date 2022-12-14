// {
//     "id": 1,
//     "name": "Leanne Graham",
//     "username": "Bret",
//     "email": "Sincere@april.biz",

//     "address": {
//       "street": "Kulas Light",
//       "suite": "Apt. 556",
//       "city": "Gwenborough",
//       "zipcode": "92998-3874",
//       "geo": {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//       }
//     },

import 'address.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String latitude, longitude;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.latitude,
      required this.longitude});

  static User convertJsonToUser(Map json) {
    return User(
      id: json['id'] ?? -1, // null
      name: json['name'] ?? "",
      username: json['username'] ?? "",
      email: json['email'] ?? "",
      address: Address.convertJsonToAddress(json['address'] ?? {}),
      latitude: json['address']['geo']['lat'],
      longitude: json['address']['geo']['lng'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "username": username,
      "email": email,
      "address": address.toMap()
    };
  }
}
