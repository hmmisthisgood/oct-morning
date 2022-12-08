import 'dart:async';

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() {
    return _CounterScreenState();
  }
}

class _CounterScreenState extends State<CounterScreen> {
  late int count;
  late Timer secondsTimer;
  void onPreessedButton() {
    // print("Previous count valyue: $count  ");
    count = count + 1;
    // print("New count valyue: $count  ");
    setState(() {});
  }

  startTimer() {
    /// after certain time run once
    // final timer = Timer(Duration(seconds: 5), () {});

    final duration = Duration(seconds: 10);

    secondsTimer = Timer.periodic(
      Duration(milliseconds: 1),
      (timer) {
        count = count + 1;
        setState(() {});

        final duration = Duration(milliseconds: count);

        final milli = duration.inMilliseconds;
        final seconds = duration.inSeconds;
        final minutes = duration.inMinutes;
        final hours = duration.inHours;
        print(" $hours:$minutes:$seconds:$milli");
      },
    );

    /// periodacally run
  }

  @override
  Widget build(BuildContext context) {
    // print("Build called:::::");
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              secondsTimer.cancel();
            },
            child: const Icon(Icons.stop),
          ),
          FloatingActionButton(
            onPressed: onPreessedButton,
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
          child: Text(
        "You have pressed the button \n ${count} \n times",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    count = 0;

    print("Init state called");
    startTimer();
  }

  @override
  void didUpdateWidget(covariant CounterScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}
