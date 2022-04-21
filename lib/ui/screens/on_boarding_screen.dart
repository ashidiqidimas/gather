import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../styles/gather_text_style.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 130,
          ),
          child: PageView(
            controller: controller,
            children: [
              buildOnBoardingPage(
                  image: 'assets/shared/images/on_boarding_img_1.png',
                  title: 'Find Friends\nfor Travel',
                  description:
                      'Invite someone to your trip, join an open trip, or travel'
                      'with complete strangers. Your will never feel lonely again.'),
              buildOnBoardingPage(
                image: 'assets/shared/images/on_boarding_img_1.png',
                title: 'Find Hidden\nGems Near You',
                description:
                    'See places your friends travel to or explore what is '
                    'trending near you. You will never running out of places to go.',
              ),
              buildOnBoardingPage(
                image: 'assets/shared/images/on_boarding_img_1.png',
                title: 'Book Ticket\nEasily',
                description:
                    'Book your ticket with one click at home, then scan your '
                    'e-ticket at the locket. Travel can’t get easier than this.',
              ),
              buildOnBoardingPage(
                  image: 'assets/shared/images/on_boarding_img_1.png',
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
          const SizedBox(
            height: 40,
          ),
          Image.asset(
            image,
          ),
          const SizedBox(
            height: 80,
          ),
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
        ],
      ),
    );
  }

  Widget buildBottomSheet() {
    return Container(
      padding: const EdgeInsets.only(
        right: 32,
        left: 24,
        bottom: 29,
      ),
      color: Colors.white,
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildSmoothPageIndicator(),
        ],
      ),
    );
  }

  SmoothPageIndicator buildSmoothPageIndicator() {
    return SmoothPageIndicator(
      onDotClicked: (index) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
      },
      effect: const ExpandingDotsEffect(
        expansionFactor: 5,
        spacing: 8,
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: Color.fromRGBO(100, 149, 243, 1),
        dotColor: Color.fromRGBO(173, 205, 253, 1),
      ),
      controller: controller,
      count: 4,
    );
  }
}
