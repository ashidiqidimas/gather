import 'package:flutter/material.dart';
import 'package:gather/ui/styles/colors/gather_color.dart';

import 'package:google_fonts/google_fonts.dart';

import 'colors/gather_text_color.dart';

class GatherTheme {
  static TextTheme lightTextTheme = TextTheme(
    /// base text style for text with primary color
    labelLarge: GoogleFonts.poppins(color: GatherTextColor.primary),

    /// base text style for text with secondary color
    labelMedium: GoogleFonts.poppins(color: GatherTextColor.secondary),

    /// base text style for text with tertiary color
    labelSmall: GoogleFonts.poppins(color: GatherTextColor.tertiary),
  );

  static light() {
    return ThemeData(
      textTheme: lightTextTheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: GatherColor.neutral
      )
    );
  }
}
