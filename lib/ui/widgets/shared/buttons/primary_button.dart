import 'package:flutter/material.dart';
import 'package:gather/ui/styles/all_styles.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton.large({
    Key? key,
    required this.textLabel,
    required this.onPressed,
  }) : buttonHeight = 50, super(key: key);

  final String textLabel;
  final void Function()? onPressed;
  final int buttonHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: GatherColor.primarySwatch[500]!.withOpacity(0.2),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        child: Text(
          textLabel,
          style: GatherTextStyle.headline(context).copyWith(
            color: GatherColor.background,
          ),
        ),
        onPressed: onPressed,
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              const Size.fromHeight(50),
            ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return GatherColor.neutralSwatch[200]!;
            }
            return GatherColor.primarySwatch[500]!;
          }),
          overlayColor: MaterialStateProperty.all(GatherColor.primarySwatch[300]),
        ),
      ),
    );
  }
}
