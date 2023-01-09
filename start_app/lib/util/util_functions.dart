// bool isDarkMode() {}

import 'package:flutter/material.dart';
import 'package:start_app/util/theme.dart';

class Functions {
  static bool isDarkMode(ThemeData theme) {
    bool isDark = theme.scaffoldBackgroundColor == CustomTheme.darkBgColor;
    return isDark;
  }
}
