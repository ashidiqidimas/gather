import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../business_logic/constants/router_path.dart';
import '../styles/all_styles.dart';
import '../widgets/components/email_continue_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: RouterPath.signUp,
      key: ValueKey(RouterPath.signUp),
      child: const SignUpScreen(),
    );
  }

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  bool _isUsingEmail = false;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 150,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _playForward() async {
    try {
      await _animationController.forward();
      debugPrint('play forward');
    } on TickerCanceled {
      debugPrint('Forward animation canceled');
    }
  }

  Future<void> _playBackward() async {
    try {
      await _animationController.reverse().orCancel;
    } on TickerCanceled {
      debugPrint('Forward animation canceled');
    }
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
                const SizedBox(
                  height: 48,
                ),
                ElevatedButton(
                  onPressed: () => debugPrint('Unimplemented: Apple sign up'),
                  child: SizedBox(
                    height: 22,
                    width: 223,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                            'assets/shared/icons/apple-button-logo.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Continue with Apple',
                          style: GatherTextStyle.headline(context).copyWith(
                            color: Colors.grey[100],
                          ),
                        ),
                      ],
                    ),
                  ),
                  style: GatherButtonStyle.primaryLarge.copyWith(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.black,
                    ),
                    shadowColor: MaterialStateProperty.all(
                      Colors.grey[300],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () => debugPrint(
                      'Unimplemented: Continue with Google is not implemented'),
                  child: SizedBox(
                    height: 22,
                    width: 223,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                            'assets/shared/icons/google-button-logo.png'),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Continue with Google',
                          style: GatherTextStyle.headline(context).copyWith(
                            color: GatherTextColor.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  style: GatherButtonStyle.primaryLarge.copyWith(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.all(Colors.grey[100]),
                    side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.black, width: 1),
                    ),
                    shadowColor: MaterialStateProperty.all(
                      Colors.grey[50],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: Text(
                    'OR',
                    style: GatherTextStyle.body3(context),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                AnimatedCrossFade(
                  firstChild: Column(
                    children: [
                      Container(
                        height: 82,
                        width: double.infinity,
                        color: Colors.yellow,
                        child: Center(child: Text('TODO: Build email form'),),
                      ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                  secondChild: const SizedBox(
                    height: 1,
                  ),
                  crossFadeState: _isUsingEmail
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 200),
                ),
                EmailContinueButton(
                  onPressed: () {
                    setState(() {
                      if (_isUsingEmail) {
                        // TODO: Handle email format is wrong
                        // TODO: Handle email already exist
                        // TODO: Sign Up using Firebase Auth
                        _isUsingEmail = false; // TODO: Delete
                        _playBackward();
                      } else {
                        _isUsingEmail = true;
                        _playForward();
                      }
                    });
                  },
                  isUsingEmail: _isUsingEmail,
                  animationController: _animationController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
