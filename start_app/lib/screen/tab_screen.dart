import 'package:flutter/material.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.purple,
          leading: Icon(Icons.arrow_back_ios),
          title: Text("TabBar"),
          actions: [
            Icon(Icons.bookmark_outline),
            Icon(Icons.question_mark),
          ],
          bottom: TabBar(
            tabs: [
              Text("Home"),
              Text("Games"),
              Text("Movies"),
            ],
            isScrollable: true,
          ),
        ),
      ),
    );
  }
}
