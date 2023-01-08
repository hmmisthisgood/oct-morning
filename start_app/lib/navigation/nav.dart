import 'package:flutter/material.dart';

class Nav {
  static final navKey = GlobalKey<NavigatorState>();

  static push(Widget child) {
    final BuildContext _ctx = navKey.currentContext!;

    Navigator.push(_ctx, MaterialPageRoute(builder: (_) => child));
  }

  pushN() {}

  static void pop() {
    final BuildContext _ctx = navKey.currentContext!;
    Navigator.pop(_ctx);
  }
}
