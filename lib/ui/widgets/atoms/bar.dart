import 'package:flutter/material.dart';

import '../../styles/colors/gather_color.dart';

class Bar extends StatelessWidget {
  const Bar({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        color: GatherColor.primarySwatch[isActive ? 300 : 100],
        height: 5,
        child: Container(
          color: GatherColor.primarySwatch[isActive ? 500 : 200],
          height: 2,
          width: double.infinity,
        ),
      ),
    );
  }
}