import 'package:flutter/material.dart';
import 'package:gather/ui/styles/all_styles.dart';

class SecondaryButton extends StatelessWidget {
  SecondaryButton.large({
    Key? key,
    required this.textLabel,
    required this.onPressed,
  }) : buttonHeight = 50, super(key: key);

  final String textLabel;
  final void Function()? onPressed;
  final int buttonHeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        textLabel,
        style: GatherTextStyle.headline(context).copyWith(
          color: GatherColor.primarySwatch[500],
        ),
      ),
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size.fromHeight(50),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: GatherColor.primarySwatch[500]!
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return GatherColor.neutralSwatch[200]!;
          }
          return Colors.transparent;
        }),
        overlayColor: MaterialStateProperty.all(GatherColor.primarySwatch[100]),
      ),
    );
  }
}
