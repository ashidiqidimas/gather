import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gather/business_logic/managers/all_managers.dart';
import 'package:gather/ui/widgets/components/sign_up/auth_form_field.dart';
import 'package:gather/ui/widgets/shared/all_shared_widgets.dart';
import 'package:gather/ui/widgets/shared/buttons/tertiary_button.dart';
import 'package:provider/provider.dart';

import '../../../constants/router_path.dart';
import '../../widgets/components/progress_bar_indicator.dart';

class SignUpProfileScreen extends StatefulWidget {
  const SignUpProfileScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: RouterPath.signUpProfile,
      key: ValueKey(RouterPath.signUpProfile),
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

  File? _profileImage;

  @override
  void dispose() {
    _firstNameEditingController;
    _lastNameEditingController;
    super.dispose();
  }

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
                        // TODO: Upload name to DB
                        log('Continue to About button pressed');
                        if (_formKey.currentState!.validate()) {
                          Provider.of<SignUpManager>(context, listen: false)
                              .nextSignUpScreen();
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
                child: ProgressBarIndicator(
                  activeIndex: 1,
                  leftOffsets: const [19.5, 12, 11.5],
                  stages: const ['Account', 'Profile', 'About'],
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
            isLastForm: true,
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
          _profileImage == null
              ? Image.asset('assets/shared/images/default-profile-picture.png')
              : ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    _profileImage!,
                    height: 100,
                    width: 100,
                  ),
                ),
          const SizedBox(
            height: 10,
          ),
          TertiaryButton(
            onPressed: () async {
              final newProfilePath =
                  await Provider.of<ProfileManager>(context, listen: false)
                      .changeProfilePicture();
              if (newProfilePath != null) {
                setState(() => _profileImage = File(newProfilePath));
              }
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
