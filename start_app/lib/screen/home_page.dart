import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(color: Colors.grey),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      bottomNavigationBar: Container(height: 50, color: Colors.green),
      drawer: Drawer(),
    );
  }
}


/// Scaffold
/// AppBar
/// Drawer
/// FloatingActionButton

/// Container = just a box