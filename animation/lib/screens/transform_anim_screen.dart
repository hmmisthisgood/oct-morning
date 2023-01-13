import 'dart:math';

import 'package:flutter/material.dart';

class TransformAnimScreen extends StatefulWidget {
  const TransformAnimScreen({super.key});

  @override
  State<TransformAnimScreen> createState() => _TransformAnimScreenState();
}

class _TransformAnimScreenState extends State<TransformAnimScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
      reverseDuration: Duration(milliseconds: 2000),
    );
    // controller.forward();
    controller.addListener(listenController);
  }

  void listenController() {
    print(controller.value);
    if (controller.isCompleted) {
      // controller.repeat();
    }

    // 0-1: 0 0.001 0.002, 0 ... 1
    // 0-1: 0.1,0.2,o0.3, ...1
  }

  var angle = pi;

  // increaseAngle() {
  //   Timer.periodic(Duration(milliseconds: 10), (time) {
  //     angle = pi + 1;
  //     setState(() {});
  //   });
  // }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build called");
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: height,
        width: width,
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (controller.isCompleted) {
                    controller.reverse();
                    return;
                  }
                  controller.forward();
                },
                child: AnimatedBuilder(
                  animation: controller,
                  child: const Icon(Icons.abc),
                  builder: (context, child) {
                    final value = controller.value;
                    print("value in builder: $value");

                    /// 0.0
                    ///
                    return Transform.translate(
                      offset: Offset(
                          value == 0 ? width * value : width * value - 40, 0
                          // value == 0 ? height * value : height * value - 100,
                          ),

                      /// (0, 0)---> (360-40, 0)
                      /// (0,0)----> (360-40, 1000-40)
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(), shape: BoxShape.circle),
                        child: Transform.rotate(
                            angle: 2 * pi * value,
                            child: IconButton(
                                onPressed: () {
                                  if (controller.isCompleted) {
                                    controller.reverse();
                                    return;
                                  }
                                  controller.forward();
                                },
                                icon: child!
                                //  Icon(Icons.home),
                                )
                            // Text(
                            //   "Rotating",
                            //   style: TextStyle(fontSize: 26),
                            // ),
                            ),
                      ),
                    );
                  },
                ),
              )
            ]),
      ),
    );
  }
}
