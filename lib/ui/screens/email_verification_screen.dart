import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gather/business_logic/managers/app_state_manager.dart';
import 'package:gather/ui/styles/all_styles.dart';
import 'package:gather/ui/widgets/shared/all_shared_widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/router_path.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: RouterPath.signUpAbout,
      key: ValueKey(RouterPath.signUpAbout),
      child: const EmailVerificationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/shared/images/mail-sent.png')),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Verification Sent',
              style: GatherTextStyle.title1(context)
                  .copyWith(color: GatherTextColor.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'We have sent you an email with verification link.\n'
              'If you have done, please relaunch the app.',
              style: GatherTextStyle.body1(context)
                  .copyWith(color: GatherTextColor.secondary),
            ),
            const SizedBox(
              height: 40,
            ),
            PrimaryButton.large(
              textLabel: 'Open Email',
              onPressed: () {
                // if (Platform.isIOS) {
                //   launchUrl(Uri.parse('message://'));
                // }
                Provider.of<AppStateManager>(context, listen: false)
                    .listenAuthState();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            SecondaryButton.large(
              textLabel: 'Resend Email',
              onPressed: () async =>
                  await Provider.of<AppStateManager>(context, listen: false)
                      .sendVerificationEmail(),
            ),
            // TODO: Delete
            // SecondaryButton.large(
            //   textLabel: 'Log out',
            //   onPressed: () async =>
            //       Provider.of<AppStateManager>(context, listen: false)
            //           .signedOut(),
            // ),
          ],
        ),
      ),
    );
  }
}
