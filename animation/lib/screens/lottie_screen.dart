import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatelessWidget {
  const LottieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Lottie.asset("assets/animation/loading.json", height: 150, width: 150),
        // Image.asset("assets/animation/loading.gif"),
        Lottie.asset("assets/animation/car.json", height: 200),
        Lottie.asset("assets/animation/data.json"),
      ]),
    );
  }
}
