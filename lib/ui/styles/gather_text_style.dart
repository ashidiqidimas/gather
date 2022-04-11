import 'package:flutter/material.dart';

class GatherTextStyle {
  /// Use for postName in PostCard
  static TextStyle subhead2(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
          fontSize: 17,
          height: 1.29,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        );
  }

  /// Use for location in PostName
  static TextStyle caption(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith(
          fontSize: 13,
          height: 1.15,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        );
  }

  static TextStyle callout(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium!.copyWith(
          fontSize: 14,
          height: 1.35,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        );
  }
}
