import 'package:flutter/material.dart';

import '../../business_logic/constants/router_path.dart';
import '../styles/all_styles.dart';
import 'all_screens.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: RouterPath.signUp,
      key: ValueKey(RouterPath.signUp),
      child: const SignUpScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Center(
          child: Text('Sign up screen',
              style: GatherTextStyle.title1(context),
          ),
        ),
      ),
    );
  }
}
