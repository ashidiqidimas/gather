import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business_logic/managers/app_state_manager.dart';
import '../widgets/shared/buttons/primary_button.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: PrimaryButton.large(
            textLabel: 'Open Email',
            onPressed: () {
              Provider.of<AppStateManager>(context, listen: false).signOut();
            },
          ),
        ),
    );
  }
}
