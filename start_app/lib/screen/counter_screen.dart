import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  void onPreessedButton() {
    print("Previous count valyue: $count  ");
    count = count + 1;
    print("New count valyue: $count  ");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("Build called:::::");
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      floatingActionButton: FloatingActionButton(
        onPressed: onPreessedButton,
        child: Icon(Icons.add),
      ),
      body: Center(
          child: Text(
        "You have pressed the button \n $count \n times",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
