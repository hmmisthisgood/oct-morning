import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IgHomeScreen extends StatelessWidget {
  final imageUrl =
      "https://mir-s3-cdn-cf.behance.net/project_modules/fs/a8f1b467595609.5b3f01fdb77ae.png";
  final personImage =
      "https://cdn.pixabay.com/photo/2016/11/29/20/22/girl-1871104__480.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(personImage,
                        height: 50, width: 50, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 10),
                  Text("westly.winder"),
                ],
              ),
              Icon(Icons.more_horiz)
            ],
          ),
          Image.network(imageUrl),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border_rounded, size: 35),
                  SizedBox(width: 10),
                  Icon(Icons.comment, size: 35),
                  SizedBox(width: 10),
                  Icon(Icons.send, size: 35),
                ],
              ),
              Icon(Icons.bookmark_border, size: 35),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text("Hiii !!!!!"),
              SizedBox(width: 10),
              Text("#hashtag", style: TextStyle(color: Colors.blue))
            ],
          ),
        ]),
      ),
    );
  }
}

/// Container
/// ClipRRect = makes something round
/// Icon
/// IconButton
/// Image : asset, network, file, memory
/// SizedBox = just a box


/// Icon = Widget
/// IconButton= Widget
/// Icons.home= name of the icons
/// IconData= the type of icon