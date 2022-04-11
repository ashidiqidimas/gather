import 'package:flutter/material.dart';
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
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This is a subhead 2',
            style: GatherTextStyle.subhead2(context),
          ),
          Text(
            'This is a caption',
            style: GatherTextStyle.caption(context),
          ),
          Text(
            'This is a callout',
            style: GatherTextStyle.callout(context),
          ),
        ],
      ),
    );
  }
}
