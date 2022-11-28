import 'package:flutter/material.dart';

enum Position { top, bottom, left, right }

class CS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Position.top;
    // Position.bottom;
    // Position.right;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Container widget",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Container(
        height: 200,
        width: 300,
        // color: Colors.black,
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          // color: Color.fromRGBO(255, 0, 255, 0.2),
          color: Colors.white,
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.3),
          boxShadow: [
            BoxShadow(
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(5, 5),
                color: Colors.pink.withOpacity(0.3)),
          ],
          // gradient: LinearGradient(
          //     colors: [Colors.blue, Colors.pink],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter),
        ),
        child: Container(
          color: Colors.black,
          margin: EdgeInsets.all(20),
          // padding: EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
            child: Text(
              "This should be in center",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      )),
    );
  }
}

class ContainerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container SCreen", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(30),
              border: Border.all()),
          child: Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              // boxShadow: [BoxShadow()],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.blue, Colors.black],
              ),
            ),
            child: Text(
              "Gradient",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}








/// For colors: Colors.black,
/// Color(0xff00FF00) Color(0xff383838)
/// R, G, B values: 0-255
// / Color.fromRGBO(255, 0, 255, 1)

/// screen= Scaffold
/// Text
///  Center
/// Container

// For Layout:
/// Row , Column 
