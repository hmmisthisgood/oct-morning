import 'package:flutter/cupertino.dart';

import '../utils/env.dart';

class HashtagWidget extends InheritedWidget {
  String hashtag;
  Env env;

  Widget child;
  Key? key;
  HashtagWidget(
      {required this.hashtag, required this.child, this.key, required this.env})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static HashtagWidget of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<HashtagWidget>();
    return widget!;
  }
}
