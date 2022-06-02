import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gather/business_logic/managers/all_managers.dart';
import 'package:gather/ui/widgets/components/sign_up/input_hint.dart';
import 'package:provider/provider.dart';

import '../../../constants/router_path.dart';
import '../../styles/all_styles.dart';
import '../../widgets/components/sign_up/auth_form_field.dart';
import '../../widgets/components/sign_up/email_continue_button.dart';

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
  final TextEditingController _emailEditingController = TextEditingController();
  bool _isEmailAlreadyExist = false;

  final _formKey = GlobalKey<FormState>();

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
    _emailEditingController.dispose();
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
                buildTermsAndConditions(context),
                const SizedBox(
                  height: 48,
                ),
                buildSignUpApple(context),
                const SizedBox(
                  height: 16,
                ),
                buildSignUpGoogle(context),
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
                      SizedBox(
                        height: 110,
                        width: double.infinity,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              AuthFormField.forEmail(
                                title: 'Email',
                                textEditingController: _emailEditingController,
                              ),
                              if (_isEmailAlreadyExist)
                                const InputHint.withError(
                                    text: 'Email already exist'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
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
                  onPressed: () async {
                    if (_isUsingEmail) {
                      if (_formKey.currentState!.validate()) {
                        // if Email is valid
                        debugPrint('Email valid');
                        try {
                          bool isEmailAlreadyExist =
                          await Provider.of<ProfileManager>(context,
                              listen: false)
                              .checkEmail(_emailEditingController.text);
                          debugPrint('check email: $isEmailAlreadyExist');
                          if (isEmailAlreadyExist) {
                            setState(() {
                              _isEmailAlreadyExist = true;
                            });
                            debugPrint('Email already exist');
                          } else {
                            Provider.of<SignUpManager>(context, listen: false)
                                .nextSignUpScreen();
                            Provider.of<ProfileManager>(context, listen: false)
                                .updateEmail(_emailEditingController.text);
                            debugPrint('Email not exist');
                          }
                        } catch (e) {
                          showDialog(context: context, builder: (_) => AlertDialog(
                            title: const Text('Error'),
                            content: Text(e.toString()),
                            actions: [
                              TextButton(onPressed: () {}, child: const Text('OK'))
                            ],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ));
                        }
                        
                      } else {
                        debugPrint('Email not valid');
                      }
                    } else {
                      setState(() {
                        _isUsingEmail = true;
                        _playForward();
                      });
                    }
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

  ElevatedButton buildSignUpGoogle(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          debugPrint('Unimplemented: Continue with Google is not implemented'),
      child: SizedBox(
        height: 22,
        width: 223,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/shared/icons/google-button-logo.png'),
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
    );
  }

  ElevatedButton buildSignUpApple(BuildContext context) {
    return ElevatedButton(
      onPressed: () => debugPrint('Unimplemented: Apple sign up'),
      child: SizedBox(
        height: 22,
        width: 223,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/shared/icons/apple-button-logo.png'),
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
    );
  }

  RichText buildTermsAndConditions(BuildContext context) {
    return RichText(
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
              ..onTap = () => debugPrint('Terms and Conditions clicked'),
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
    );
  }
}
