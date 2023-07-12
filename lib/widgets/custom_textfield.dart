import 'package:flutter/material.dart';
import 'package:web_evaluation/resources/screenutils.dart';

import '../constants/app_constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.obstext = false,
    required this.textEditingController,
    required this.labelText,
    this.validator,
    required this.keyboardtype,
    this.autofillHints,
  });
  final bool obstext;
  final TextEditingController textEditingController;
  final String labelText;
  final String keyboardtype;
  final String? Function(String?)? validator;
  final List<String>? autofillHints;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: screenwidth * 0.02, right: screenwidth * 0.02),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: widget.obstext,
        controller: widget.textEditingController,
        validator: widget.validator!,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.labelText,
        ),
        autofillHints: widget.autofillHints,
        keyboardType: widget.keyboardtype == email
            ? TextInputType.emailAddress
            : TextInputType.text,
      ),
    );
  }
}
