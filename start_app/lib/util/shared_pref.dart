import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const _IS_USER_LOGGED_IN = "isUserLoggedIn";

  static const _APP_OPENED_FIRST_TIME = "appOpenedFirstTime";

  static const _USER_TOKEN = "userAuthToken";
  static const _IS_DARK_MODE = "isdarkmode";

  static void setUserLoggedIn(bool value) async {
    final instance = await SharedPreferences.getInstance();
    instance.setBool(_IS_USER_LOGGED_IN, value);
  }

  static Future<bool> getUserLoggedIn() async {
    final instance = await SharedPreferences.getInstance();

    return instance.getBool(_IS_USER_LOGGED_IN) ?? false;
  }

  static Future<void> clearAll() async {
    final instance = await SharedPreferences.getInstance();
    await instance.clear();
  }

  static setIsDarkTheme(bool value) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setBool(_IS_DARK_MODE, value);
  }

  static Future<bool?> getIsDarkTheme() async {
    final instance = await SharedPreferences.getInstance();
    final isDark = await instance.getBool(_IS_DARK_MODE);
    return isDark;
  }
}
