import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:start_app/util/strings.dart';

class StackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Image.network(imageUrl),
          Container(color: Colors.green.withOpacity(0.3)),
          Container(color: Colors.white.withOpacity(0.5)),
          Positioned(
            bottom: 50,
            right: 40,
            child: Row(
              children: [Icon(Icons.home, size: 50), Icon(Feather.camera)],
            ),
          ),
          Positioned(
            top: 100,
            right: 100,
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  size: 50,
                  color: Colors.red,
                ),
                Icon(Feather.camera)
              ],
            ),
          )
        ],
      ),
    );
  }
}
/// Stack used for:
/// - overlapping UI
/// - Absolute positioning of items in the UI

//// Positioned : for absolute position: widget that can be used only inside stack 
/// Align : for relative postition