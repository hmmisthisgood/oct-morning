import 'package:animation/screens/custom_clip_screen.dart';
import 'package:animation/screens/custom_paint_screen.dart';
import 'package:animation/screens/hero1.dart';
import 'package:animation/screens/lottie_screen.dart';
import 'package:animation/screens/transform_anim_screen.dart';
import 'package:animation/screens/transform_screen.dart';
import 'package:flutter/material.dart';
import '../navigation/nav.dart';
import 'anim_container_screen.dart';

class NavScreen extends StatelessWidget {
  NavScreen({super.key});

  List<Map<String, dynamic>> screens = [
    {"name": "Hero anmation", "widget": HeroScreen()},
    {"name": "Lottie anmation", "widget": LottieScreen()},
    {"name": "Transform", "widget": TransformScreen()},
    {"name": "Animated Container", "widget": AnimContainerScreen()},
    {"name": "Transform animated builder", "widget": TransformAnimScreen()},
    {"name": "Custom Clipper screen", "widget": CustomClipScreen()},
    {"name": "Custom Paint screen", "widget": CustomPaintSCreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: screens.length,
            itemBuilder: (context, index) {
              final screen = screens[index];

              return MaterialButton(
                  color: Colors.red,
                  child: Text(
                    screen['name'],
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   CupertinoPageRoute(builder: (_) => screen['widget']),
                    // );
                    Navigator.push(
                        context, topBottomRoute(child: screen['widget']));
                  });
            }),
      ),
    );
  }
}
