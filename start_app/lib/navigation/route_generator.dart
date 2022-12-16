import 'package:flutter/material.dart';
import 'package:start_app/navigation/routes.dart';
import 'package:start_app/screen/ig_post_screen.dart';
import 'package:start_app/screen/login_screen.dart';

import '../screen/home_screen.dart';

Route customRouteGenerator(RouteSettings settings) {
  final routeName = settings.name;

  switch (routeName) {
    case Routes.rootScreen:
      return MaterialPageRoute(builder: (ctx) => Homepage());
    case Routes.loginScreen:
      return MaterialPageRoute(builder: (ctx) => LoginScreen());
    case "/images":
      return MaterialPageRoute(builder: (ctx) => IgHomeScreen());
    case Routes.homeScreen:
      return MaterialPageRoute(builder: (ctx) => IgHomeScreen());
    default:
      return MaterialPageRoute(builder: (ctx) => LoginScreen());
  }
}
