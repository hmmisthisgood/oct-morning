import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as apiClient;

import '../model/user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  fetchUsers() async {
    print("Fetching users");
    try {
      final url = "https://jsonplaceholder.typicode.com/users";
      final uri = Uri.parse(url);
      final response = await apiClient.get(uri);

      print("Status code is : ${response.statusCode}");
      final List usersList = json.decode(response.body); // List<Map>

      /// List<Map> -----> List<User>

      final oneUser = usersList[0];
      final convertedUser = User.convertJsonToUser(oneUser);

      // users = usersList.map((item) {
      //   return User.convertJsonToUser(item);
      // }).toList();

      // print(users.length);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
