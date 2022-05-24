import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gather/ui/screens/profile_image_picker.dart';
import 'package:gather/ui/widgets/components/sign_up/auth_form_field.dart';
import 'package:gather/ui/widgets/shared/all_shared_widgets.dart';
import 'package:gather/ui/widgets/shared/buttons/tertiary_button.dart';

import '../../business_logic/constants/all_constants.dart';
import '../widgets/components/sign_up/sign_up_page_indicator.dart';

class SignUpProfileScreen extends StatefulWidget {
  const SignUpProfileScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: RouterPath.signUpAccount,
      key: ValueKey(RouterPath.signUpAccount),
      child: const SignUpProfileScreen(),
    );
  }

  @override
  State<SignUpProfileScreen> createState() => _SignUpProfileScreenState();
}

class _SignUpProfileScreenState extends State<SignUpProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameEditingController =
      TextEditingController();

  final TextEditingController _lastNameEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignUpAppbar(),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildPhotoProfile(),
                    buildForm(),
                    PrimaryButton.large(
                      textLabel: 'Continue to About',
                      onPressed: () {
                        log('Continue to About button pressed');
                        if (_formKey.currentState!.validate()) {

                          // TODO: Go to about sign up page
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
                  index: 1,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AuthFormField(
            title: 'First Name',
            textEditingController: _firstNameEditingController,
            hintText: 'Rizqia',
          ),
          const SizedBox(
            height: 16,
          ),
          AuthFormField(
            title: 'Last Name',
            textEditingController: _lastNameEditingController,
            hintText: 'Amalia',
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget buildPhotoProfile() {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Image.asset(
            'assets/shared/images/default-profile-picture.png',
          ),
          const SizedBox(
            height: 10,
          ),
          TertiaryButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileImagePicker()));
              log('Change Photo button pressed');
            },
            labelText: 'Change Photo',
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
