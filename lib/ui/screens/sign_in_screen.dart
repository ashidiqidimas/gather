import 'package:flutter/material.dart';

import '../../constants/router_path.dart';
import '../styles/all_styles.dart';
import 'all_screens.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: RouterPath.signIn,
      key: ValueKey(RouterPath.signIn),
      child: const SignInScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lightBlue,
        child: Center(
          child: Text('Sign in screen',
            style: GatherTextStyle.title1(context),
          ),
        ),
      ),
    );
  }
}
