import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/post.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String apiData = "Loading ...";
  List postsList = [];
  List<Post> postData = [];
  bool isLoading = true;
  bool hasErrorOccured = false;
  String errorMessage = "";
  Map userData = {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {"lat": "-37.3159", "lng": "81.1496"}
    }
  };

  @override
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  // get(){}

  fetchDataFromServer() async {
    final url = "https://jsonplaceholder.typicode.com/posts";
    // final url = "2.0";

    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);

      apiData = response.body;

      final List decodedList = json.decode(response.body); // List<Map>
      postsList = decodedList;

      final postMap = decodedList[0];
      Post realPost = Post.convertJsonToPost(postMap);

      postData = decodedList.map<Post>(
        (item) {
          final convertedPost = Post.convertJsonToPost(item);

          return convertedPost;
          // return Post.convertJsonToPost(item);
        },
      ).toList();

      postData = decodedList.map((e) => Post.convertJsonToPost(e)).toList();

      /// List<Map> -----> List<Post>

      /// success
      isLoading = false;

      setState(() {});
    } catch (e, stackTace) {
      print(e);
      print(stackTace);
      hasErrorOccured = true;
      isLoading = false;
      errorMessage = e.toString();
      setState(() {});
    }

    print("This is also executed");

    // http.get(uri).then((value) {});
  }

//  condition? ---- : -----;

  Widget buildBody() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (hasErrorOccured) {
      return Center(child: Text(errorMessage));
    }

    return ListView.builder(
      itemCount: postData.length,
      itemBuilder: (context, index) {
        // final post = postsList[index];
        final Post post = postData[index];

        return Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${index + 1}. ${post.title}",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(post.body),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: buildBody());
  }
}
