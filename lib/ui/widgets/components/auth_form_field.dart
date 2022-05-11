import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import '../../styles/all_styles.dart';
import 'input_hint.dart';

class AuthFormField extends StatefulWidget {
  AuthFormField.forEmail({
    Key? key,
    required this.title,
    required this.textEditingController,
  })  : isLastForm = true,
        textInputType = TextInputType.emailAddress,
        super(key: key) {
    _validator = (_) {
      final value = textEditingController.text;
      if (value.isEmpty) {
        return 'Please input an email address';
      } else {
        if (!EmailValidator.validate(value)) {
          return 'Please check your email address';
        }
      }
      return null;
    };
  }

  AuthFormField({
    Key? key,
    required this.title,
    required this.textEditingController,
    this.isLastForm = false,
    this.textInputType = TextInputType.none,
  }) : super(key: key) {
    _validator = (_) {
      final value = textEditingController.text;
      if (value.isEmpty) {
        return 'Please input a ${title.toLowerCase()}';
      }
      return null;
    };
  }

  final String title;
  final TextEditingController textEditingController;
  final bool isLastForm;
  final TextInputType textInputType;

  late final String? Function(String? value) _validator;

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  @override
  Widget build(BuildContext context) {
    return FormField(builder: _builder, validator: widget._validator
        // TODO: Change validator according _isFirstEmailField
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
          keyboardType: widget.textInputType,
          textInputAction:
              widget.isLastForm ? TextInputAction.done : TextInputAction.next,
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: GatherColor.error,
              ),
            ),
            contentPadding: const EdgeInsets.all(16),
            hintText: 'example@mail.com',
            hintStyle: GatherTextStyle.body3(context),
          ),
          controller: widget.textEditingController,
          style: GatherTextStyle.body1(context),
        ),
        const SizedBox(
          height: 8,
        ),
        if (state.hasError) InputHint.withError(text: state.errorText!),
      ],
    );
  }
}
