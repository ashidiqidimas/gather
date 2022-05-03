import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../business_logic/constants/router_path.dart';
import '../styles/all_styles.dart';

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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Sign Up',
                  style: GatherTextStyle.title1(context),
                ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                  text: TextSpan(
                    text: 'By signing up, you agree to our\n',
                    style: GatherTextStyle.subhead2(context),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: GatherTextStyle.subhead2(context).copyWith(
                          color: GatherColor.primarySwatch[500]!,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => debugPrint('Terms and Conditions clicked'),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: GatherTextStyle.subhead2(context),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: GatherTextStyle.subhead2(context).copyWith(
                          color: GatherColor.primarySwatch[500]!,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => debugPrint('Privacy Policy'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                // TODO: social button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
