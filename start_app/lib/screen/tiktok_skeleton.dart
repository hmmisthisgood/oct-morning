import 'package:flutter/material.dart';
import 'package:start_app/util/assets.dart';

class TikTokSkeleton extends StatelessWidget {
  const TikTokSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.grey,
      ),
      body: SafeArea(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(children: [
            // Image.asset(
            //   Assets.pieces,
            //   fit: BoxFit.cover,
            //   height: screenHeight,
            // ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 200,
                color: Colors.green,
                width: screenWidth / 2,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 100,
                height: 450,
                color: Colors.pink,
              ),
            ),
            Positioned(
              left: screenWidth / 4,
              child: Container(
                height: 30,
                width: 200,
                color: Colors.orange,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
