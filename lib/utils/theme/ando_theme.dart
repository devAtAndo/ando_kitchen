import 'package:flutter/material.dart';

import 'theme.dart';

class AndoTheme {
  static ThemeData theme() {
    return ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
        }),
        fontFamily: getFontFamily(FontFamily.sans));
  }
}
