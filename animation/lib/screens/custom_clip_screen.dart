import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CustomClipScreen extends StatelessWidget {
  const CustomClipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
        )
      ]),
    );
  }
}

/// ClipPath = Clipper
/// CustomClipper = class