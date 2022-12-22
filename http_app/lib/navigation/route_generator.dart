import 'package:flutter/material.dart';
import 'package:http_app/screen/homepage.dart';
import 'package:http_app/screen/images_screen.dart';

import '../screen/future_b_screen.dart';

Route customRouteGenerator(RouteSettings settings) {
  final routeName = settings.name;

  switch (routeName) {
    case "/":
      return MaterialPageRoute(builder: (ctx) => Homepage());
    case "/images":
      return MaterialPageRoute(builder: (ctx) => ImagesScreen());
    case "/futureScreen":
      return MaterialPageRoute(builder: (ctx) => FutureBScreen());

    default:
      return MaterialPageRoute(builder: (ctx) => Homepage());
  }
}
