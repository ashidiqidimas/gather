import 'package:flutter/material.dart';

import '../../business_logic/constants/all_constants.dart';

class SignUpAccountScreen extends StatelessWidget {
  const SignUpAccountScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: RouterPath.signUpAccount,
      key: ValueKey(RouterPath.signUpAccount),
      child: const SignUpAccountScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          'TODO: Sign Up account form',
        ),
      ),
    );
  }
}
