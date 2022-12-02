import 'package:flutter/material.dart';
import 'package:start_app/widget/instaggram_post.dart';

class IgScreenwithBuilder extends StatelessWidget {
  final List<String> usernames = [
    "john",
    "rock",
    "cena",
    "jeff",
    "daniel",
    "jessica",
    "anna",
    "bina",
    "maria"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: ListView.builder(
        itemCount: usernames.length,
        itemBuilder: (context, index) {
          final name = usernames[index];
          return InstagramPost(username: name);
          // return Container(
          //   height: 100,
          //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          //   decoration: BoxDecoration(
          //       color: Color.fromRGBO(Random().nextInt(255),
          //           Random().nextInt(255), Random().nextInt(255), 1)),
          //   alignment: Alignment.center,
          //   child: Text(
          //     name,
          //     style: TextStyle(color: Colors.white),
          //   ),
          // );
        },
      ),
    );
  }
}
