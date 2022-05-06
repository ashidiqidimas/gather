import 'package:flutter/material.dart';

import 'package:gather/ui/styles/colors/gather_color.dart';

class GatherTextStyle {
  /// Use for on boarding title
  static TextStyle title1(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
      fontSize: 30,
      height: 1.2,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    );
  }

  /// Use for postName in PostCard
  static TextStyle subhead1(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 17,
          height: 1.294,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        );
  }

  static TextStyle subhead2(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
      fontSize: 15,
      height: 1.33,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    );
  }

  static TextStyle headline(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
      fontSize: 17,
      height: 1.294,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    );
  }

  static TextStyle button1(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
      fontSize: 17,
      height: 1.294,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    );
  }

  static TextStyle button2(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
          fontSize: 15,
          height: 1.466,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: Colors.white,
        );
  }
// test
  static TextStyle appbarTitle(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
      fontSize: 22,
      height: 1,
      fontWeight: FontWeight.w600,
      letterSpacing: 2,
      color: GatherColor.primarySwatch[500],
    );
  }

  static TextStyle bottomBarLabel(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.24,
      color: GatherColor.primarySwatch[500],
    );
  }

  /// Body style with primary color
  static TextStyle body1(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
          fontSize: 17,
          height: 1.29,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        );
  }

  /// Body style with secondary color
  static TextStyle body2(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium!.copyWith(
      fontSize: 17,
      height: 1.29,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    );
  }

  /// Body style with tertiary color
  static TextStyle body3(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith(
      fontSize: 17,
      height: 1.29,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    );
  }

  /// Use for location in PostName
  static TextStyle footnote(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith(
          fontSize: 13,
          height: 1.15,
          fontWeight: FontWeight.w400,
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
