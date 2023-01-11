import 'package:animation/screens/hero1.dart';
import 'package:animation/screens/lottie_screen.dart';
import 'package:animation/screens/transform_screen.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatelessWidget {
  NavScreen({super.key});

  List<Map<String, dynamic>> screens = [
    {"name": "Hero anmation", "widget": HeroScreen()},
    {"name": "Lottie anmation", "widget": LottieScreen()},
    {"name": "Transform", "widget": TransformScreen()},
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => screen['widget']));
                  });
            }),
      ),
    );
  }
}
