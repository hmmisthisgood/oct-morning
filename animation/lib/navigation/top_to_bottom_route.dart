import 'package:flutter/material.dart';

/// Class
class TopBottomRoute extends PageRoute {
  final Widget child;

  TopBottomRoute({required this.child});

  @override
  Color? get barrierColor => Colors.black.withOpacity(0.3);

  @override
  String? get barrierLabel => "barrier";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
//// 0.0 ,....., 1.0

    final topToBottomTween = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset(0, 0),
    );

    final bottomToTop = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    );

    final rightToLeft = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset(0, 0),
    );

    final leftToRight = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    );

    return SlideTransition(
      position: animation.drive(topToBottomTween),
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 400);

  @override
  Duration get reverseTransitionDuration => Duration(milliseconds: 400);
}

/// using function

Route topBottomRoute({required Widget child}) {
  return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 500),
      reverseTransitionDuration: Duration(milliseconds: 500),
      barrierColor: Colors.red,
      maintainState: true,
      pageBuilder: (context, anim1, anim2) => child,
      transitionsBuilder: (context, anim1, anim2, child) {
        final topToBottomTween = Tween<Offset>(
          begin: Offset(0, -1),
          end: Offset(0, 0),
        );
        return SlideTransition(
          position: anim1.drive(topToBottomTween),
          child: child,
        );
      });
}





/// Slide Transition
/// Fade Transition
/// Scale Transition
