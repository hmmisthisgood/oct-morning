import 'package:flutter/material.dart';
import 'package:start_app/screen/ig_post_screen.dart';
import 'package:start_app/screen/ss.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  PreferredSizeWidget buildTabBar() {
    return TabBar(
      // isScrollable: true,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 3,
      indicatorPadding: EdgeInsets.only(bottom: 4),
      unselectedLabelColor: Colors.black,
      labelColor: Colors.orange,

      labelStyle: TextStyle(fontSize: 20),
      unselectedLabelStyle: TextStyle(fontSize: 16),
      onTap: (index) {
        print("$index tab clicked");
      },
      tabs: [
        // Text("Home"),
        // Text("Games"),
        // Text("Movies"),
        // Text("Books"),
        // Text("Comics"),
        Icon(Icons.grid_on_rounded, size: 25),
        Icon(Icons.person, size: 35)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.purple,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
          title: Text("TabBar"),
          actions: [
            Icon(Icons.bookmark_outline),
            Icon(Icons.question_mark),
          ],
          // bottom: buildTabBar(),
        ),
        body:
            //  TabBarView(
            //   children: [IgHomeScreen(), StackScreen()],
            // )
            Column(children: [
          Container(height: 200, color: Colors.grey.withOpacity(0.4)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MaterialButton(
              onPressed: () {},
              child: Text("Edit Profile"),
              // color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey)),
              minWidth: double.infinity,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Click Me"),
          ),
          Container(color: Colors.grey.withOpacity(0.2), child: buildTabBar()),
          Expanded(
            child: TabBarView(
              children: [IgHomeScreen(), StackScreen()],
            ),
          )
        ]),
      ),
    );
  }
}

/// DefaultTabController
/// TabBar
/// TabBarView


/// MaterialButton
/// ElevatedButton
/// FlatButton xxx deprecated
/// RaisedButton xxx deprectated
/// TextButton