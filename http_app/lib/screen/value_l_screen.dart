import 'package:flutter/material.dart';
import 'package:http_app/utils/strings.dart';

class ValueListenScreen extends StatelessWidget {
  ValueListenScreen({super.key});

  final ValueNotifier<int> count = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.value = count.value + 1;
        },
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: count,
        child: Image.network(
          treeImage,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        builder: (context, data, someWidget) {
          print("value listen builder ccalled");
          return Stack(
            children: [
              someWidget!,
              Center(
                child: Text(
                  "You have pressed button  $data times",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// ValueListenableBuilder
