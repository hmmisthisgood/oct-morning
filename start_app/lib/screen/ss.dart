import 'package:flutter/material.dart';

import '../util/strings.dart';

class StackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: screenHeight,
            width: screenWidth,
          ),
          Container(color: Colors.red.withOpacity(0.3)),

          Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.home, size: 50),
          ),

          Positioned(
            bottom: 20,
            // left: 300,
            right: 10,
            child: Icon(Icons.search, size: 50),
          ),
          Container(
            height: 150,
            width: 150,
            color: Colors.white,
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ),
              ),
              Positioned(
                right: 30,
                bottom: 30,
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ]),
          )

          // Container(color: Colors.white.withOpacity(0.5)),
        ],
      ),
    );
  }
}

/// Positioned -= can use absolute position
/// Align = uses relative position