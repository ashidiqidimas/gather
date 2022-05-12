import 'package:flutter/material.dart';

import '../../../styles/all_styles.dart';

class EmailContinueButton extends StatelessWidget {
  EmailContinueButton({
    Key? key,
    required this.animationController,
    required this.onPressed,
    required this.isUsingEmail,
  })  : backgroundColorAnimation = ColorTween(
          begin: GatherColor.primarySwatch[100]!,
          end: GatherColor.primarySwatch[500]!,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.0,
              1.0,
              curve: Curves.easeOut,
            ),
          ),
        ),
        foregroundColorAnimation = ColorTween(
          begin: GatherColor.primarySwatch[600]!,
          end: GatherColor.background,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.0,
              1.0,
              curve: Curves.easeOut,
            ),
          ),
        ),
        super(key: key);

  final bool isUsingEmail;
  final Function() onPressed;
  final Animation<double> animationController;
  final Animation<Color?> backgroundColorAnimation;
  final Animation<Color?> foregroundColorAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, Widget? _) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: GatherColor.primarySwatch[100]!.withOpacity(0.25),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          'Continue with Email',
          style: const TextStyle(fontFamily: 'Poppins').copyWith(
            fontSize: 17,
            height: 1.294,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
          ),
        ),
        style: GatherButtonStyle.primaryLarge.copyWith(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return GatherColor.neutralSwatch[200]!;
            }
            return backgroundColorAnimation.value;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return GatherColor.neutralSwatch[500]!;
            }
            return foregroundColorAnimation.value;
          }),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed) && !isUsingEmail) {
              return GatherColor.primarySwatch[500]!;
            }
            return GatherColor.primarySwatch[300]!;
          }),
        ),
      ),
    );
  }
}
