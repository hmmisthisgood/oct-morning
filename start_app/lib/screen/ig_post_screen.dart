import 'package:flutter/material.dart';
import 'package:start_app/widget/ig_post.dart';

class IgHomeScreen extends StatelessWidget {
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

/// Container
/// ClipRRect = makes something round
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