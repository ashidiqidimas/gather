import 'package:flutter/material.dart';

import '../../../styles/all_styles.dart';
import 'indicator.dart';

class SignUpPageIndicator extends StatelessWidget {
  const SignUpPageIndicator({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -24,
              left: -19.5,
              child: Text(
                'Account',
                style: GatherTextStyle.subhead2(context).copyWith(
                  color: GatherColor.primarySwatch[600],
                ),
              ),
            ),
            Image.asset('assets/shared/icons/active-indicator.png'),
          ],
        ),
        Indicator(
          isActive: index >= 1,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -24,
              left: -12,
              child: Text(
                'Profile',
                style: GatherTextStyle.subhead2(context).copyWith(
                  color: index >= 1
                      ? GatherColor.primarySwatch[600]
                      : GatherColor.primarySwatch[400],
                ),
              ),
            ),
            // Image.asset('assets/shared/icons/inactive-indicator.png'),
            Image.asset(() {
              if (index == 0) {
                return 'assets/shared/icons/inactive-indicator.png';
              } else if (index == 1) {
                return 'assets/shared/icons/current-indicator.png';
              } else {
                return 'assets/shared/icons/active-indicator.png';
              }
            }()),
          ],
        ),
        Indicator(isActive: index == 2),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -24,
              left: -11.5,
              width: 63,
              child: Text(
                'About',
                style: GatherTextStyle.subhead2(context).copyWith(
                  color: index == 2
                      ? GatherColor.primarySwatch[600]
                      : GatherColor.primarySwatch[400],
                ),
              ),
            ),
            Image.asset(() {
              if (index < 2) {
                return 'assets/shared/icons/inactive-indicator.png';
              } else {
                return 'assets/shared/icons/last-indicator.png';
              }
            }()),
          ],
        ),
      ],
    );
  }
}
