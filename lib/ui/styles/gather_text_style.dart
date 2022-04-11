import 'package:flutter/material.dart';

class GatherTextStyle {
  static TextStyle subhead2(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
          fontSize: 17,
          height: 1.25,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        );
  }

  static TextStyle caption(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith(
          fontSize: 15,
          height: 1.23,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        );
  }

  static TextStyle callout(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium!.copyWith(
          fontSize: 15,
          height: 1.23,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        );
  }
}
