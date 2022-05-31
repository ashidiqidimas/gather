import 'package:flutter/material.dart';
import 'package:gather/ui/widgets/components/progress_bar_indicator.dart';

import '../../constants/router_path.dart';

class BuildScreen extends StatelessWidget {
  const BuildScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: RouterPath.build,
      key: ValueKey(RouterPath.build),
      child: const BuildScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),
            ProgressBarIndicator(
              activeIndex: 0,
              leftOffsets: const [19.5, 12, 11.5],
              stages: const ['Account', 'Profile', 'About'],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
