import 'dart:math';

import 'package:flutter/material.dart';

class AnimContainerScreen extends StatefulWidget {
  const AnimContainerScreen({super.key});

  @override
  State<AnimContainerScreen> createState() => _AnimContainerScreenState();
}

class _AnimContainerScreenState extends State<AnimContainerScreen> {
  double _height = 150;
  double _width = 150;
  Color _color = Colors.green;
  var shape = BoxShape.rectangle;
  var _radius = 20.0;
  var _opacity = 1.0;

  List colors = [
    Colors.red,
    Colors.blue,
    Colors.black,
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.orange,
    Colors.indigo
  ];

  double? l;
  var r = 0.0;
  var b = 0.0;
  double? t;
  double? left;
  var right = 0.0;
  var bottom = 0.0;
  double? top;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // color: Colors.green,
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            AnimatedPositioned(
              top: top,
              left: left,
              right: right,
              bottom: bottom,
              duration: Duration(seconds: 3),
              child: InkWell(
                onTap: () {
                  _height = 20 + Random().nextDouble() * 500;
                  _width = 20 + Random().nextDouble() * 400;

                  int index = Random().nextInt(colors.length);

                  _color = colors[index];

                  _radius = Random().nextDouble() * 100;
                  right = Random().nextDouble() * 300;
                  bottom = Random().nextDouble() * 300;
                  setState(() {});
                },
                child: AnimatedContainer(
                  height: _height,
                  width: _width,
                  decoration: BoxDecoration(
                      color: _color,
                      borderRadius: BorderRadius.circular(_radius)

                      // shape: shape,
                      ),
                  duration: Duration(seconds: 3),
                  curve: Curves.easeInOutCubic,
                ),
              ),
            ),
            AnimatedPositioned(
              left: l,
              top: t,
              right: r,
              bottom: b,
              duration: Duration(seconds: 4),
              child: InkWell(
                onTap: () {
                  r = 200;
                  b = 200;
                  setState(() {});
                },
                child: Text(
                  "Positioned",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Container(
              height: 200,
              color: Colors.red,
            ),
            InkWell(
              onTap: () {
                _opacity = _opacity == 0 ? 1 : 0;
                setState(() {});
              },
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: Container(
                  height: 250,
                  width: 250,
                  // color: Colors.pink,
                  child: Image.asset(
                    "assets/image/image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(height: 100, color: Colors.black),
            // AnimatedAlign(
            //   alignment: Alignment.bottomLeft,
            //   duration: Duration(seconds: 1),
            //   child: AnimatedIcon(
            //     icon: AnimatedIcons.add_event,
            //     progress: 0,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}


/// Implicit Animated Widgets: 
/// 1. AnimatedContainer
/// 2. AnimatedPositioned
/// 3. AnimatedOpacity
/// 4. AnimatedIcon
/// 5. AnimatedAlign
/// Interpolation:
  
/// Duration 
/// Curve