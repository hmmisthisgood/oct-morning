import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:start_app/util/shared_pref.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  saveTheme({required bool isDarkMode}) {
    SharedPref.setIsDarkTheme(isDarkMode);
  }

  initThemes() async {
    bool? isDarkMode = await SharedPref.getIsDarkTheme();
    if (isDarkMode == null) {
      emit(ThemeMode.system);
    }

    if (isDarkMode == true) {
      emit(ThemeMode.dark);
    }

    if (isDarkMode == false) {
      emit(ThemeMode.light);
    }
  }

  toggleTheme(bool isDarkMode) {
    print("current theme is dark mode: $isDarkMode");
    if (isDarkMode == true) {
      emit(ThemeMode.light);

      saveTheme(isDarkMode: false);
      return;
    }

    emit(ThemeMode.dark);
    saveTheme(isDarkMode: true);
  }
}
