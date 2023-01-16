import 'package:flutter/material.dart';

Route scaleRoute({required Widget child}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation1, animation2) => child,
    transitionDuration: Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final scaleTween = Tween(begin: 0.0, end: 1.0);

      return ScaleTransition(
        scale: animation.drive(scaleTween),
        child: child,
      );
    },
  );
}
