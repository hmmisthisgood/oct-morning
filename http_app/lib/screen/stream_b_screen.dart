import 'dart:async';

import 'package:flutter/material.dart';

class StreamBScreen extends StatelessWidget {
  StreamBScreen({super.key});

  final StreamController<int> timeStremController =
      StreamController.broadcast();
  int count = 0;
  start() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      count = count + 1;
      if (count == 5) {
        timeStremController.addError("5 error");
      } else {
        timeStremController.add(count);
      }

      if (count == 15) {
        timeStremController.close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        start();
      }),
      body: Center(
        child: StreamBuilder<int>(
          stream: timeStremController.stream,
          builder: ((context, snapshot) {
            print(snapshot.connectionState);

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("No data Available");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return Text("Will not have more data");
            }
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasError) return Text(snapshot.error.toString());

              return Text(snapshot.data.toString(),
                  style: TextStyle(fontSize: 20));
            }

            return Text("Something else");
          }),
        ),
      ),
    );
  }
}
