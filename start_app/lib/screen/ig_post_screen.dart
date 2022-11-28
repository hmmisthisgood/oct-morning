import 'package:flutter/material.dart';
import 'package:start_app/util/strings.dart';
import 'package:start_app/widget/ig_post.dart';

class Ig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              IgPost(),
              IgPost(),
              IgPost(),
              IgPost(),
              IgPost(),
            ],
          )),
    );
  }
}

class IgHomeScreen extends StatelessWidget {
  const IgHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        /// top user's name and photo section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.network(
                    personImage,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Text("maria"),
              ],
            ),
            Icon(Icons.more_horiz)
          ],
        ),

        /// Post's main image
        Image.network(imageUrl),

        /// Like, comment, share , save buttons

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.favorite_outline),
                Icon(Icons.comment),
                Icon(Icons.send),
              ],
            ),
            Icon(Icons.bookmark_outline)
          ],
        ),

        /// Like count
        Text("2875 likes"),

        Row(
          children: [
            /// caption
            Text("maria  Hi!    q"),
            Text(
              "#worldcup",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ]),
    );
  }
}





/// Container
/// ClipRRect = makes anything round
/// Icon
/// IconButton
/// Image : asset, network, file, memory
/// FadeInImage
/// SizedBox = just a box


/// Icon = Widget
/// IconButton= Widget
/// Icons.home= name of the icons
/// IconData= the type of icon
/// 

/// For scrolling:
/// - ListView
/// - SingleChildScrollView
/// - GridView
/// - PageView
/// - CustomScrollView/NestedScrollView