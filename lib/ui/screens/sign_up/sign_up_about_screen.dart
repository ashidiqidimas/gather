import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/all_constants.dart';
import '../../widgets/components/progress_bar_indicator.dart';
import '../../widgets/components/sign_up/auth_form_field.dart';
import '../../widgets/shared/all_shared_widgets.dart';

class SignUpAboutScreen extends StatefulWidget {
  const SignUpAboutScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: RouterPath.signUpAbout,
      key: ValueKey(RouterPath.signUpAbout),
      child: const SignUpAboutScreen(),
    );
  }

  @override
  State<SignUpAboutScreen> createState() => _SignUpAboutScreenState();
}

class _SignUpAboutScreenState extends State<SignUpAboutScreen> {
  final _formKey = GlobalKey<FormState>();

  final _birthdayEditingController = TextEditingController();

  final _bioEditingController = TextEditingController();

  @override
  void dispose() {
    _birthdayEditingController;
    _bioEditingController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignUpAppbar(),
      body: SafeArea(
        minimum: const EdgeInsets.only(
          left: 24,
          top: 16,
          right: 24,
        ),
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildForm(context),
                buildPrimaryButton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildIndicator(),
    );
  }

  Container buildIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
      ),
      height: 83,
      // color: Colors.red[50],
      child: ProgressBarIndicator(
        activeIndex: 2,
        leftOffsets: const [19.5, 12, 11.5],
        stages: const ['Account', 'Profile', 'About'],
      ),
    );
  }

  PrimaryButton buildPrimaryButton() {
    return PrimaryButton.large(
      textLabel: 'Join 2Gather',
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          // TODO: Upload data to DB

          // TODO: Go to email confirmation screen
        }
      },
    );
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AuthFormField(
            title: 'Birthday',
            textEditingController: _birthdayEditingController,
            infoText: 'We will show your age to other users'
                'to help them connect with you',
            hintText: DateFormat('dd-mm-yyyy').format(DateTime.now()),
            readOnly: true,
            onTap: () async {
              final birthday = await showDatePicker(
                  context: context,
                  // TODO: Change to initialDate now - 18 year
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now());

              if (birthday != null) {
                final formattedDate = DateFormat('dd-mm-yyyy').format(birthday);
                setState(() {
                  _birthdayEditingController.text = formattedDate;
                });
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          AuthFormField(
            title: 'Bio',
            textEditingController: _bioEditingController,
            hintText: 'Maximum 200 characters',
            infoText: 'Describe yourself to let others know you',
            maxLines: 9,
            isLastForm: true,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
