import 'package:animation/custom_paint/painter.dart';
import 'package:flutter/material.dart';

class CustomPaintSCreen extends StatelessWidget {
  const CustomPaintSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomPaint(
            painter: TrianglePainter(),
            child: Container(
              height: 300,
              width: 300,
            ),
          )
        ],
      ),
    );
  }
}

/// CustomPaint ---> widget
/// CustomPainter ---> painter clas
