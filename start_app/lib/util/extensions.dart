import 'package:flutter/material.dart';

extension StringExtension on String {
  String addNewLine() {
    return "\n\n $this \n\n";
  }
}

// This is string.

//
//This is string.
//

extension Themes on ThemeData {
  TextStyle? get h6 {
    return this.textTheme.headline6;
  }

  TextStyle? get h5 {
    return this.textTheme.headline5;
  }

  TextStyle? get h4 {
    return this.textTheme.headline4;
  }

  TextStyle? get h3 {
    return this.textTheme.headline3;
  }

  TextStyle? get h2 {
    return this.textTheme.headline2;
  }

  TextStyle? get h1 {
    return this.textTheme.headline1;
  }
}
