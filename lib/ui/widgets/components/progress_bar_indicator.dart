import 'package:flutter/material.dart';

import '../../../constants/label_position.dart';
import '../../styles/all_styles.dart';
import '../atoms/bar.dart';

class ProgressBarIndicator extends StatelessWidget {
  ProgressBarIndicator({
    Key? key,
    required this.activeIndex,
    required this.stages,
    required this.leftOffsets,
    this.labelPosition = LabelPosition.onTop,
  })  : assert(stages.length == leftOffsets.length,
            'Number of stages should match number of offsets'),
        assert(stages.length == 2 || stages.length == 3,
            'Stages length must be 2 or 3'),
        length = stages.length,
        super(key: key);

  /// The current active index.
  /// Start from 0
  final int activeIndex;

  /// The label for the stages.
  /// The length must between 2 or 3.
  final List<String> stages;

  /// Offsets for each label.
  /// The value should be positive.
  final List<double> leftOffsets;

  /// The position for the labels.
  /// The default value is onTop
  final LabelPosition labelPosition;

  late final int length;

  @override
  Widget build(BuildContext context) {
    if (length == 3) {
      return Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: labelPosition == LabelPosition.onTop ? -24 : null,
                left: -1 * leftOffsets[0],
                child: Text(
                  'Account',
                  style: GatherTextStyle.subhead2(context).copyWith(
                    fontWeight:
                        activeIndex == 0 ? FontWeight.w600 : FontWeight.w400,
                    color: GatherColor.primarySwatch[600],
                  ),
                ),
              ),
              Image.asset('assets/shared/icons/active-indicator.png'),
            ],
          ),
          Bar(
            isActive: activeIndex >= 1,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: labelPosition == LabelPosition.onTop ? -24 : null,
                left: -1 * leftOffsets[1],
                child: Text(
                  'Profile',
                  style: GatherTextStyle.subhead2(context).copyWith(
                    fontWeight:
                        activeIndex == 1 ? FontWeight.w600 : FontWeight.w400,
                    color: activeIndex >= 1
                        ? GatherColor.primarySwatch[600]
                        : GatherColor.primarySwatch[400],
                  ),
                ),
              ),
              Image.asset(() {
                if (activeIndex == 0) {
                  return 'assets/shared/icons/inactive-indicator.png';
                } else if (activeIndex == 1) {
                  return 'assets/shared/icons/current-indicator.png';
                } else {
                  return 'assets/shared/icons/active-indicator.png';
                }
              }()),
            ],
          ),
          Bar(isActive: activeIndex == 2),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: labelPosition == LabelPosition.onTop ? -24 : null,
                left: -1 * leftOffsets[2],
                child: Text(
                  'About',
                  style: GatherTextStyle.subhead2(context).copyWith(
                    fontWeight:
                        activeIndex == 2 ? FontWeight.w600 : FontWeight.w400,
                    color: activeIndex == 2
                        ? GatherColor.primarySwatch[600]
                        : GatherColor.primarySwatch[400],
                  ),
                ),
              ),
              Image.asset(() {
                if (activeIndex < 2) {
                  return 'assets/shared/icons/inactive-indicator.png';
                } else {
                  return 'assets/shared/icons/last-indicator.png';
                }
              }()),
            ],
          ),
        ],
      );
    } else {
      return Row(

      );
    }
  }
}
