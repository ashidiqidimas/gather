import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gather/ui/widgets/atoms/bar.dart';
import 'package:gather/ui/widgets/components/progress_bar_indicator.dart';

const stages3 = ['Account', 'Profile', 'About'];
const List<double> leftOffsets3 = [19.5, 12, 11.5];

Widget buildProgressBarWithThreeLabels({required int activeIndex}) =>
    MaterialApp(
      home: Scaffold(
        // padding: const EdgeInsets.symmetric(horizontal: 24),
        body: ProgressBarIndicator(
          activeIndex: activeIndex,
          leftOffsets: leftOffsets3,
          stages: stages3,
        ),
      ),
    );

void main() {
  group('ProgressBarIndicator widget test', () {
    testWidgets('Testing if ProgressBarIndicator exist', (tester) async {
      await tester.pumpWidget(buildProgressBarWithThreeLabels(activeIndex: 0));
      expect(find.byType(ProgressBarIndicator), findsOneWidget);
    });

    // With 3 labels

    testWidgets('Testing if it has 3 labels', (tester) async {
      await tester.pumpWidget(buildProgressBarWithThreeLabels(activeIndex: 0));
      expect(find.text(stages3[0]), findsOneWidget);
      expect(find.text(stages3[1]), findsOneWidget);
      expect(find.text(stages3[2]), findsOneWidget);
    });

    testWidgets('Testing the images for activeIndex = 0', (tester) async {
      await tester.pumpWidget(buildProgressBarWithThreeLabels(activeIndex: 0));
      expect(
        find.image(FileImage(
          File('assets/shared/icons/active-indicator.png'),
        )),
        findsOneWidget,
      );
      expect(
        find.image(FileImage(
          File('assets/shared/icons/active-indicator.png'),
        )),
        findsOneWidget,
      );
      expect(
        find.image(FileImage(
          File('assets/shared/icons/inactive-indicator.png'),
        )),
        findsOneWidget,
      );
    });
    
    testWidgets('Testing the widget has 2 bars', (tester) async {
      await tester.pumpWidget(buildProgressBarWithThreeLabels(activeIndex: 0));
      expect(find.byType(Bar), findsNWidgets(2));
    });
  });
}
