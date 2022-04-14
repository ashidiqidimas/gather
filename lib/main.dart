import 'package:flutter/material.dart';

import '../ui/styles/gather_theme.dart';
import '../ui/widgets/components/post_card.dart';
import '../ui/widgets/shared/gather_appbar.dart';
import '../ui/widgets/shared/gather_bottom_navigation_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: GatherTheme.light(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GatherAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          PostCard(),
        ],
      ),
      bottomNavigationBar: GatherBottomNavigationBar(),
    );
  }
}

