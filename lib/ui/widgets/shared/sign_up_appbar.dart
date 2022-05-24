import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../business_logic/managers/sign_up_manager.dart';
import '../../styles/all_styles.dart';

class SignUpAppbar extends StatelessWidget implements PreferredSizeWidget {
  SignUpAppbar({Key? key}) : super(key: key);

  final titles = [
    'Account',
    'Profile',
    'About',
  ];

  @override
  Size get preferredSize => const Size.fromHeight(42.0);

  @override
  Widget build(BuildContext context) {
    // final currentTitle = titles[
    //     Provider.of<SignUpManager>(context, listen: false).getCurrentIndex - 1];
    final currentTitle = titles[1]; // TODO: Delete this line and uncomment the line above
    return AppBar(
      iconTheme: IconThemeData(
        color: GatherColor.primarySwatch[500],
      ),
      backgroundColor: GatherColor.background,
      elevation: 0,
      title: Text(
        currentTitle,
        style: GatherTextStyle.headline(
          context,
        ),
      ),
    );
  }
}
