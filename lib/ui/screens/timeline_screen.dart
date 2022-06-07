import 'package:flutter/material.dart';

import '../widgets/shared/gather_appbar.dart';

class TimelineScreen extends StatelessWidget {
  TimelineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Delete const
    return const Scaffold(
      appBar: GatherAppBar(),
      body: Text('Timeline screen'),
    );
  }
}
