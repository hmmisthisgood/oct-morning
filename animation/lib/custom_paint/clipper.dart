import 'package:flutter/cupertino.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path(); // 0,0

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
