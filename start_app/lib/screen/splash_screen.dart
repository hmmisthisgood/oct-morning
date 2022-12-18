import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start_app/util/assets.dart';
import 'package:start_app/util/shared_pref.dart';

import '../navigation/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoggedInStatusAndNavigate();
  }

  void checkLoggedInStatusAndNavigate() async {
    final isLoggedIn = SharedPref.getUserLoggedIn();

    await Future.delayed(Duration(milliseconds: 1000), () {
      if (isLoggedIn == false) {
        Navigator.pushNamed(context, Routes.loginScreen);
        return;
      }

      Navigator.pushNamed(context, Routes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.splashLogo,
          height: 120,
          width: 120,
        ),
      ),
    );
  }
}
