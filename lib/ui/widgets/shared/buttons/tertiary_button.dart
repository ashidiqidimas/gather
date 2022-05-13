import 'package:flutter/material.dart';
import 'package:gather/ui/styles/all_styles.dart';

class TertiaryButton extends StatelessWidget {
  const TertiaryButton({
    Key? key,
    required this.onPressed,
    required this.labelText,
    this.labelColor,
    this.labelStyle,
  }) : super(key: key);

  final void Function()? onPressed;
  final String labelText;

  /// The default style is [GatherTextStyle.headline].<br>
  /// If you **only** want to change the **color**, please us [labelColor].
  final TextStyle? labelStyle;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        labelText,
      ),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          labelStyle?.copyWith(color: null) ??
              GatherTextStyle.headline(context).copyWith(
                color: null,
              ),
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return GatherColor.neutralSwatch[500];
            }
            if (states.contains(MaterialState.pressed)) {
              return GatherColor.primarySwatch[100];
            }
            return GatherColor.primarySwatch[500];
          },
        ),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        fixedSize: MaterialStateProperty.all(const Size.fromHeight(44)),
      ),
    );
  }
}
