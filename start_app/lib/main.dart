import 'package:flutter/material.dart';

import 'screen/home_page.dart';

void main() {
  runApp(OurApp());
}

class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Our App",
      home: HomeScreen(),
    ); // most important widget for the app
  }
}

// Stateless widget
// Stateful widget

// MaterialApp

/// These 3 things are used only once in the app:
/// 1. main function
/// 2. runapp function
/// 3. MaterialApp widget
/// 

/// class instance= class object