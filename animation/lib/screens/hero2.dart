import 'package:flutter/material.dart';

class HeroScreen2 extends StatelessWidget {
  const HeroScreen2({super.key, required this.tag});
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero 2")),
      body: Container(
        height: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Hero(tag: tag, child: Image.asset("assets/image/image.jpg")),
        ]),
      ),
    );
  }
}
