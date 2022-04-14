import 'package:flutter/material.dart';
import 'package:gather/ui/styles/colors/gather_color.dart';

import 'colors/gather_text_color.dart';

class GatherTheme {
  static TextTheme lightTextTheme = TextTheme(
    /// base text style for text with primary color
    titleLarge: const TextStyle(fontFamily: 'Poppins')
        .copyWith(color: GatherTextColor.primary),

    /// base text style for text with secondary color
    labelMedium: const TextStyle(fontFamily: 'Poppins')
        .copyWith(color: GatherTextColor.secondary),

    /// base text style for text with tertiary color
    labelSmall: const TextStyle(fontFamily: 'Poppins')
        .copyWith(color: GatherTextColor.tertiary),
  );

  static light() {
    return ThemeData(
      fontFamily: ('Poppins'),
      textTheme: lightTextTheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.8,
        shadowColor: GatherColor.neutral,
      ),
    );
  }
}
