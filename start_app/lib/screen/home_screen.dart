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

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        color: Colors.grey,
        child: Center(
            child: Text(
          "this is center text",
          style: TextStyle(color: Colors.red, fontSize: 20),
        )),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("I am pressed");
        },
      ),
    );
  }
}








/// Scaffold
/// AppBar
/// Drawer
/// FloatingActionButton

/// Container = just a box