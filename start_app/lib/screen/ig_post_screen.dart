import 'package:flutter/material.dart';
import 'package:start_app/widget/ig_post.dart';
import '../widget/instaggram_post.dart';

class IgHomeScreen extends StatelessWidget {
  const IgHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          IgPost(),
          IgPost(),
          IgPost(),
        ],
      ),
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
/// - ListView: 
///     - ListView.builder
/// - SingleChildScrollView
/// - GridView
///     - GridView.builder
/// - PageView
///     - PageView.builder
/// - CustomScrollView/NestedScrollView (x)