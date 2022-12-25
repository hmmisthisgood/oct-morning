import 'package:flutter/material.dart';
import 'package:start_app/navigation/routes.dart';
import 'package:start_app/screen/auth/signup_screen.dart';
import 'package:start_app/screen/ig_post_screen.dart';
import 'package:start_app/screen/auth/login_screen.dart';
import 'package:start_app/screen/splash_screen.dart';

Route customRouteGenerator(RouteSettings settings) {
  final routeName = settings.name;

  switch (routeName) {
    case Routes.spalshScreen:
      return MaterialPageRoute(builder: (ctx) => SplashScreen());
    case Routes.loginScreen:
      return MaterialPageRoute(builder: (ctx) => LoginScreen());
    case "/images":
      return MaterialPageRoute(builder: (ctx) => IgHomeScreen());
    case Routes.homeScreen:
      return MaterialPageRoute(builder: (ctx) => IgHomeScreen());
    case Routes.signupScreen:
      return MaterialPageRoute(builder: (ctx) => SignupScreen());

    default:
      return MaterialPageRoute(builder: (ctx) => LoginScreen());
  }
}
