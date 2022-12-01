import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:start_app/util/strings.dart';
import 'package:start_app/widget/ig_post.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../widget/instaggram_post.dart';

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
        body: ListView(
          children: [
            InstagramPost(),
            InstagramPost(),
            InstagramPost(),
            InstagramPost(),
            InstagramPost(),
            InstagramPost(),
          ],
        ));
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