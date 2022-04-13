import 'package:flutter/material.dart';

import '../ui/widgets/components/post_card.dart';

import 'package:gather/ui/styles/colors/gather_color.dart';
import 'package:gather/ui/styles/gather_text_style.dart';
import 'package:gather/ui/styles/gather_theme.dart';

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
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Image.asset(
                  'assets/shared/icons/logo.png',
                  height: 25,
                ),
                const SizedBox(
                  width: 8,
                ),
                RichText(
                  text: TextSpan(
                    style: GatherTextStyle.appbarTitle(context),
                    children: [
                      TextSpan(
                        text: '2',
                        style: GatherTextStyle.appbarTitle(context).copyWith(
                          color: GatherColor.secondary,
                        ),
                      ),
                      const TextSpan(
                        text: 'Gather',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            splashRadius: 24,
            // TODO: on press, push screen to notification center
            onPressed: () => debugPrint('notification pressed'),
            icon: Image.asset('assets/shared/icons/bell.png'),
          ),
          IconButton(
            splashRadius: 24,
            // iconSize: 10,
            // TODO: on press, push screen to direct messages
            onPressed: () => debugPrint('direct message pressed'),
            icon: Image.asset('assets/shared/icons/message.png'),
          ),
          const SizedBox(
            width: 4,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          PostCard(),
        ],
      ),
    );
  }
}
