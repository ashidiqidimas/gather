import 'package:flutter/material.dart';

import '../../styles/all_styles.dart';

class OnBoardingButton extends StatelessWidget {
  final PageController controller;
  final int pageIndex;

  final Animation<double> animationController;
  final Animation<Color?> backgroundColorAnimation;
  final Animation<double> width;

  // backgroundColorAnimation = ColorTween(
  // begin: Colors.red,
  // end: Colors.yellow,
  // ).animate(
  // CurvedAnimation(
  // parent: animationController,
  // curve: Curves.easeIn,
  // );

  OnBoardingButton({
    Key? key,
    required this.animationController,
    required this.controller,
    required this.pageIndex,
  })  : backgroundColorAnimation = ColorTween(
          begin: Colors.green,
          end: Colors.red,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.0,
              0.2,
              curve: Curves.easeIn,
            ),
          ),
        ),
        width = Tween<double>(
          begin: 95,
          end: 155,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(
              0.0,
              0.2,
              curve: Curves.easeIn,
            ),
          ),
        ),
        super(key: key);

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return ElevatedButton(
      onPressed: () => controller.nextPage(
        duration: const Duration(
          milliseconds: 200,
        ),
        curve: Curves.easeIn,
      ),
      child: Text(
        pageIndex != 3 ? 'Next' : 'Get Started',
        style: GatherTextStyle.headline(context).copyWith(
          color: GatherColor.primarySwatch[500]!,
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
          Colors.transparent,
        ),
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
