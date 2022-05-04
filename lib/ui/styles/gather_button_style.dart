import 'package:flutter/material.dart';

class GatherButtonStyle {
  static final ButtonStyle primaryLarge = ButtonStyle(
    minimumSize: MaterialStateProperty.all(
      const Size.fromHeight(50),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevation: MaterialStateProperty.all(0),
  );
}
