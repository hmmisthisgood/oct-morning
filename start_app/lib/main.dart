import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_app/bloc/auth/auth_cubit.dart';
import 'package:start_app/bloc/theme/theme_cubit.dart';
import 'package:start_app/navigation/nav.dart';
import 'package:start_app/navigation/route_generator.dart';
import 'package:start_app/screen/stack_screen.dart';
import 'package:start_app/util/theme.dart';

import 'navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp();

  FlutterError.onError = (details) async {
    await FirebaseCrashlytics.instance.recordFlutterError(details);
  };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [
        Locale("en", "US"),
        Locale("ne", "NP"),
        Locale("fr", "FR")
      ],
      path: "asset/translations",
      fallbackLocale: Locale("en", "en_US"),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()..initThemes()),
          BlocProvider(create: (_) => AuthCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeState) {
            // final deviceLanguage = context.deviceLocale;
            // context.setLocale(deviceLanguage);

            print(themeState);
            return MaterialApp(
              title: "My App",
              navigatorKey: Nav.navKey,
              theme: CustomTheme.lightTheme,
              darkTheme: CustomTheme.darkTheme,
              highContrastDarkTheme: CustomTheme.highContrastDarkTheme,
              highContrastTheme: CustomTheme.highContrastLightTheme,
              themeMode: themeState,
              initialRoute: Routes.spalshScreen,
              onGenerateRoute: customRouteGenerator,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
            );
          },
        ),
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