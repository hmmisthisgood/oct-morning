import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_app/screen/homepage.dart';

import 'navigation/route_generator.dart';
import 'screen/images_screen.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Api App",
      initialRoute: "/",
      onGenerateRoute: customRouteGenerator,
      // home: Homepage(),
    );
  }
}
