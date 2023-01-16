import 'package:flutter/material.dart';

Route fadeRoute({required Widget child}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation1, animation2) => child,
    transitionDuration: Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final opacityTween = Tween(begin: 0.0, end: 1.0);

      return FadeTransition(
        opacity: animation.drive(opacityTween),
        child: child,
      );
    },
  );
}
