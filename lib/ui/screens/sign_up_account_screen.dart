import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gather/business_logic/managers/all_managers.dart';
import 'package:gather/ui/styles/all_styles.dart';
import 'package:gather/ui/widgets/components/sign_up/auth_form_field.dart';
import 'package:gather/ui/widgets/shared/all_shared_widgets.dart';
import 'package:provider/provider.dart';

import '../../business_logic/constants/all_constants.dart';
import '../widgets/components/sign_up/indicator.dart';
import '../widgets/components/sign_up/sign_up_page_indicator.dart';

class SignUpAccountScreen extends StatefulWidget {
  const SignUpAccountScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: RouterPath.signUpAccount,
      key: ValueKey(RouterPath.signUpAccount),
      child: const SignUpAccountScreen(),
    );
  }

  @override
  State<SignUpAccountScreen> createState() => _SignUpAccountScreenState();
}

class _SignUpAccountScreenState extends State<SignUpAccountScreen> {
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _usernameEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: SignUpAppbar(),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                // physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildEmailText(context),
                    buildForm(),
                    PrimaryButton.large(
                      textLabel: 'Continue to Profile',
                      onPressed: () {
                        log('Continue to profile button pressed');
                        if (_formKey.currentState!.validate()) {
                          // TODO: Register new account
                          // TODO: go to profile sign up page
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (MediaQuery.of(context).viewInsets.bottom < 40)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                height: 56,
                // color: Colors.red[50],
                child: const SignUpPageIndicator(
                  index: 0,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Form buildForm() {
    return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AuthFormField(
                          title: 'Username',
                          textEditingController: _usernameEditingController,
                          hintText: 'my_awesome_username',
                          infoText:
                              'Username can contains alphabets, numbers, '
                              'and underscores',
                          // TODO: Create username validator regex
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AuthFormField(
                          title: 'Password',
                          textEditingController: _passwordEditingController,
                          hintText: 'password',
                          infoText:
                              'Minimum 8 characters and contains alphabets'
                              ', numbers, special characters.',
                          textInputType: TextInputType.visiblePassword,
                          // autofillHints: const [AutofillHints.newPassword],
                          // isLastForm: false,
                          // TODO: Create password validator regex
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  );
  }

  Widget buildEmailText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          'Email',
          style: GatherTextStyle.headline(context),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: GatherColor.neutralSwatch[400]!,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            Provider.of<ProfileManager>(context, listen: false).email,
            style: GatherTextStyle.body1(context),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _passwordEditingController.dispose();
    super.dispose();
  }
}
