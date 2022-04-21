import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/styles/gather_theme.dart';
import 'business_logic/managers/all_managers.dart';
import 'ui/screens/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appStateManager = AppStateManager();

  // TODO: Add login state manager

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _appStateManager),
      ],
      child: MaterialApp(
        title: '2Gather',
        theme: GatherTheme.light(),
        // TODO: Set home to a router
        home: const OnBoardingScreen(),
      ),
    );
  }
}
