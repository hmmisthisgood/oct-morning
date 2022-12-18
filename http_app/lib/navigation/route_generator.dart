import 'package:flutter/material.dart';
import 'package:http_app/screen/homepage.dart';
import 'package:http_app/screen/images_screen.dart';

Route customRouteGenerator(RouteSettings settings) {
  final routeName = settings.name;

  switch (routeName) {
    case "/":
      return MaterialPageRoute(builder: (ctx) => Homepage());
    case "/images":
      return MaterialPageRoute(builder: (ctx) => ImagesScreen());
    default:
      return MaterialPageRoute(builder: (ctx) => Homepage());
  }
}
