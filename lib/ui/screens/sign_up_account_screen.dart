import 'package:flutter/material.dart';
import 'package:gather/business_logic/managers/all_managers.dart';
import 'package:gather/ui/styles/all_styles.dart';
import 'package:gather/ui/widgets/shared/all_shared_widgets.dart';
import 'package:provider/provider.dart';

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
      // backgroundColor: Colors.red,
      appBar: SignUpAppbar(),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildEmailText(context),
            ],
          ),
        ),
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
}
