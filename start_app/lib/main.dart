import 'package:flutter/material.dart';
import 'package:start_app/screen/container_screen.dart';
import 'package:start_app/screen/home_screen.dart';
import 'package:start_app/screen/stack_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: ContainerScreen(),
    );
  }
}

class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Our App",
      theme: ThemeData(primarySwatch: Colors.purple, textTheme: TextTheme()),
      home: StackScreen(),
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