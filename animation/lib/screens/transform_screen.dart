import 'dart:math';

import 'package:flutter/material.dart';

class TransformScreen extends StatelessWidget {
  const TransformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transporm")),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                "Android",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            color: Colors.red,
            child: Transform.rotate(
              angle: 2 * pi / 3,
              child: Text(
                "Iphone",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 30),
          Transform.scale(
            // scale: 3,
            scaleX: 10,
            scaleY: 5,
            child: Icon(Icons.android),
          ),
          Transform.translate(
            offset: Offset(200, 100),
            child: Text(
              "Here 0,0 ",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

/// Transform:
/// - rotate
/// - scale
/// - translate
/// - combined form of above
/// 


/// To rotate widgets, RotatedBox