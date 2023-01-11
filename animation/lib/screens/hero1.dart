import 'package:animation/screens/hero2.dart';
import 'package:flutter/material.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero 1")),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            final tag = "tag-$index";
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => HeroScreen2(
                                tag: tag,
                              )));
                },
                child: Hero(
                  tag: tag,
                  child: Image.asset(
                    "assets/image/image.jpg",
                    height: 100,
                    width: 150,
                  ),
                ),
              ),
            );
          }),
    );
  }
}


// Hero widget also called Hero animation