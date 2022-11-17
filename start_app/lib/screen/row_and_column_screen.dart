import 'package:flutter/material.dart';

class RowAndColumnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Row and Column")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(height: 100, color: Colors.red, width: 100),
                Container(height: 100, color: Colors.green, width: 100),
                Container(height: 100, color: Colors.red, width: 100),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

// Row
// Column
