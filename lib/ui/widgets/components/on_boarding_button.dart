import 'package:flutter/material.dart';

import '../../styles/all_styles.dart';

class OnBoardingButton extends StatelessWidget {
  final PageController controller;
  final int pageIndex;

  final Animation<double> animationController;
  final Animation<Color?> backgroundColorAnimation;
  final Animation<Color?> textColorAnimation;
  final Animation<double> width;

  OnBoardingButton({
    Key? key,
    required this.animationController,
    required this.controller,
    required this.pageIndex,
  })  : backgroundColorAnimation = ColorTween(
          begin: GatherColor.primarySwatch[100]!,
          end: GatherColor.primarySwatch[500]!,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.0,
              0.40,
              curve: Curves.easeOut,
            ),
          ),
        ),
        textColorAnimation = ColorTween(
          begin: GatherColor.primarySwatch[500]!,
          end: Colors.white,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.0,
              0.40,
              curve: Curves.easeOut,
            ),
          ),
        ),
        width = Tween<double>(
          begin: 95,
          end: 156,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.0,
              0.40,
              curve: Curves.easeOut,
            ),
          ),
        ),
        super(key: key);

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return ElevatedButton(
      onPressed: () {
        if (pageIndex != 3) {
          controller.nextPage(
            duration: const Duration(
              milliseconds: 400,
            ),
            curve: Curves.easeOut,
          );
        } else {
          // TODO: Implement sign up button
        }
      },
      child: Text(
        pageIndex != 3 ? 'Next' : 'Get Started',
        style: GatherTextStyle.headline(context).copyWith(
          color: textColorAnimation.value,
        ),
      ),
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(
          GatherColor.primarySwatch[500]!.withAlpha(50),
        ),
        elevation: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return 10;
          }
          return 0;
        }),
        overlayColor: MaterialStateProperty.all(
            // GatherColor.primarySwatch[300]!,
            pageIndex != 2
                ? GatherColor.primarySwatch[300]!
                : Colors.transparent),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => backgroundColorAnimation.value,
        ),
        fixedSize: MaterialStateProperty.all(
          Size(width.value, 50),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: _buildAnimation,
    );
  }
}
