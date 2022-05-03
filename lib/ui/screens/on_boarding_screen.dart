// Test
import 'package:flutter/material.dart';
import 'package:gather/ui/widgets/components/on_boarding_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../styles/all_styles.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  late PageController _controller;
  late AnimationController _animationController;
  int _pageIndex = 0;
  bool backwardAnimationCompleted = false;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _playForward() async {
    try {
      await _animationController.forward().orCancel.whenComplete(() {
        // TODO
      });
    } on TickerCanceled {
      debugPrint('Forward animation canceled');
    }
  }

  Future<void> _playBackward() async {
    try {
      await _animationController.reverse().orCancel;
    } on TickerCanceled {
      debugPrint('Forward animation canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(bottom: 154),
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
                if (_pageIndex == 3) {
                  _playForward();
                } else if (_pageIndex == 2) {
                  _playBackward();
                }
              });
            },
            controller: _controller,
            children: [
              buildOnBoardingPage(
                  image: 'assets/shared/images/on_boarding_img_1.png',
                  title: 'Find Friends\nfor Travel',
                  description:
                      'Invite someone to your trip, join an open trip, or travel '
                      'with complete strangers. Your will never feel lonely again.'),
              buildOnBoardingPage(
                image: 'assets/shared/images/on_boarding_img_2.png',
                title: 'Find Hidden\nGems Near You',
                description:
                    'See places your friends travel to or explore what is '
                    'trending near you. You will never running out of places to go.',
              ),
              buildOnBoardingPage(
                image: 'assets/shared/images/on_boarding_img_3.png',
                title: 'Book Ticket\nEasily',
                description:
                    'Book your ticket with one click at home, then scan your '
                    'e-ticket at the locket. Travel can’t get easier than this.',
              ),
              buildOnBoardingPage(
                  image: 'assets/shared/images/on_boarding_img_4.png',
                  title: 'Pay Split Bills\nEasily',
                  description:
                      'We automatically calculate the bills and charge everyone for '
                      'their part, so you don’t have to worry about the bills again.'),
            ],
          ),
        ),
      ),
      bottomSheet: buildBottomSheet(),
    );
  }

  Widget buildOnBoardingPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(),
          Image.asset(
            image,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: GatherTextStyle.title1(context),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                description,
                style: GatherTextStyle.body2(context),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget buildBottomSheet() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        right: 32,
        left: 24,
        bottom: 48,
      ),
      height: 154,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: buildSmoothPageIndicator(),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildLeftButton(),
              Stack(
                children: [
                  const SizedBox(
                    height: 50,
                    width: 156,
                  ),
                  AnimatedCrossFade(
                    firstChild: TextButton(
                      onPressed: () =>
                          debugPrint('Skip button not implemented'),
                      child: Text(
                        'Skip',
                        style: GatherTextStyle.headline(context).copyWith(
                          color: GatherColor.primarySwatch[500]!,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(53, 50),
                      ),
                    ),
                    secondChild: const SizedBox(
                      width: 53,
                      height: 50,
                    ),
                    crossFadeState: _pageIndex != 3
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 400),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Positioned(
                    right: 0,
                    child: OnBoardingButton(
                      controller: _controller,
                      pageIndex: _pageIndex,
                      animationController: _animationController,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLeftButton() {
    return AnimatedCrossFade(
      firstCurve: Curves.easeOut,
      secondCurve: Curves.easeOut,
      crossFadeState: _pageIndex == 0
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 400),
      firstChild: const SizedBox(
        width: 58,
        height: 50,
      ),
      secondChild: TextButton(
        onPressed: () {
          setState(() {
            _pageIndex--;
            if (_pageIndex == 2) {
              _playBackward();
            }
          });
          _controller.previousPage(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOut,
          );
        },
        child: Text(
          'Back',
          style: GatherTextStyle.button1(context).copyWith(
            color: GatherColor.grey,
          ),
        ),
        style: TextButton.styleFrom(
          minimumSize: const Size(58, 50),
        ),
      ),
    );
  }

  Widget buildSmoothPageIndicator() {
    return SmoothPageIndicator(
      onDotClicked: (index) {
        _controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      },
      effect: ExpandingDotsEffect(
        expansionFactor: 5,
        spacing: 8,
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: GatherColor.primarySwatch[300]!,
        dotColor: GatherColor.primarySwatch[200]!,
      ),
      controller: _controller,
      count: 4,
    );
  }
}

enum AnimatedProperties {
  width,
  backgroundColor,
}
