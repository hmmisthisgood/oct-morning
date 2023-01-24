import 'dart:math';

import 'package:flutter/material.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen();

  Widget buildNormalPageView() {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
            color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
                Random().nextInt(255), 1)),
        Container(
            color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
                Random().nextInt(255), 1)),
        Container(
            color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
                Random().nextInt(255), 1)),
      ],
    );
  }

  Widget buildPageViewWithBuilder() {
    return PageView.builder(
        // itemCount: 50,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
                Random().nextInt(255), 1),
            child: Center(
                child: Text(
              '${index + 1}',
              style: TextStyle(fontSize: 30, color: Colors.white),
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: buildPageViewWithBuilder()
        // buildNormalPageView(),
        );
  }
}
/// PageView
/// PageView.builder
/// PageView.custom