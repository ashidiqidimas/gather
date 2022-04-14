import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'colors/gather_text_color.dart';

class GatherTheme {
  static TextTheme lightTextTheme = TextTheme(
    /// base text style for text with primary color
    titleLarge: TextStyle(fontFamily: 'Poppins').copyWith(color: GatherTextColor.primary),

    /// base text style for text with secondary color
    labelMedium: TextStyle(fontFamily: 'Poppins').copyWith(color: GatherTextColor.secondary),

    /// base text style for text with tertiary color
    labelSmall: TextStyle(fontFamily: 'Poppins').copyWith(color: GatherTextColor.tertiary),
  );

  static light() {
    return ThemeData(
      textTheme: lightTextTheme,
    );
  }
}
