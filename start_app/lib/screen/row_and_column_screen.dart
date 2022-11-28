import 'package:flutter/material.dart';

import '../util/strings.dart';

class RCScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Row and Column")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(height: 100, color: Colors.red, width: 100),
                Container(height: 100, color: Colors.green, width: 100),
                Container(height: 100, color: Colors.red, width: 100),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(height: 100, color: Colors.purple, width: 100),
                Container(height: 100, color: Colors.white, width: 100),
                Container(height: 100, color: Colors.blue, width: 100),
              ],
            ),
            Container(height: 100, color: Colors.red, width: 100),
            Container(height: 100, color: Colors.green, width: 100),
            Container(height: 100, color: Colors.black, width: 100),
          ],
        ),
      ),
    );
  }
}

class RowAndColumnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.grey,
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text("1. Nepal"),
            // Text("2. China"),
            // Text("3. India"),
            Icon(Icons.search),
            Icon(Icons.home, color: Colors.white, size: 40),
            GestureDetector(
              onTap: () {
                print("Image pressed");
              },
              onDoubleTap: () {
                print("Double pressed");
              },
              child: Image.network(imageUrl),
            ),

            Container(height: 100, width: 80, color: Colors.green),
            // Container(height: 100, width: 80, color: Colors.blue),
            Expanded(
                flex: 3,
                child: Container(height: 100, width: 80, color: Colors.red)),
            Flexible(
                flex: 1,
                child: Container(height: 100, width: 80, color: Colors.orange))
          ],
        ),
      ),
    );
  }
}


/// Expanded 
/// Flexible



// Row
// Column


/// Make everyting clickable:
/// InkWell
/// GestureDetector