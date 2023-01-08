import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_app/bloc/auth/auth_cubit.dart';
import 'package:start_app/navigation/nav.dart';
import 'package:start_app/navigation/route_generator.dart';
import 'package:start_app/screen/stack_screen.dart';

import 'navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: MaterialApp(
        title: "My App",
        navigatorKey: Nav.navKey,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: TextTheme(
            headline6: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
        initialRoute: Routes.spalshScreen,
        onGenerateRoute: customRouteGenerator,
      ),
    );
  }
}

class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Our App",
      theme: ThemeData(primarySwatch: Colors.purple, textTheme: TextTheme()),
      home: StackScreen(),
    ); // most important widget for the app
  }
}

// Stateless widget  
// Stateful widget



// MaterialApp

/// These 3 things are used only once in the app:
/// 1. main function
/// 2. runapp function
/// 3. MaterialApp widget
/// 

/// class instance= class object