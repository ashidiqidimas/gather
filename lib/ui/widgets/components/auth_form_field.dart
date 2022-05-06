import 'package:flutter/material.dart';

import '../../styles/all_styles.dart';
import 'input_hint.dart';

class AuthFormField extends StatefulWidget {
  AuthFormField({
    Key? key,
    required this.title,
    required this.textEditingController,
  }) : super(key: key);

  final String title;
  TextEditingController textEditingController;

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: _builder,
    );
  }

  Widget _builder(FormFieldState<String> state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GatherTextStyle.headline(context),
        ),
        const SizedBox(
          height: 4,
        ),
        TextField(
          decoration: InputDecoration(
            fillColor: GatherColor.formBackground,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: GatherColor.primarySwatch[500]!,
                )),
            contentPadding: const EdgeInsets.all(16),
            hintText: 'example@mail.com',
            hintStyle: GatherTextStyle.body3(context),
          ),
          controller: widget.textEditingController,
          style: GatherTextStyle.body1(context),
        ),
        if (true)
          const SizedBox(height: 8,),
          const InputHint.withError(text: 'This email already exist'),
      ],
    );
  }
}
