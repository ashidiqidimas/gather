import 'package:flutter/material.dart';
import 'package:gather/ui/styles/all_styles.dart';

class InputHint extends StatelessWidget {
  const InputHint.withError({
    Key? key,
    required this.text,
  })  : _icon = 'assets/shared/icons/warning-icon.png',
        _color = GatherColor.error,
        super(key: key);

  final String _icon;
  final Color _color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          width: 13,
        ),
        Image.asset(_icon),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: GatherTextStyle.footnote(context).copyWith(
            color: _color,
          ),
        ),
      ],
    );
  }
}
