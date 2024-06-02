import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/utils/custom_text_field.dart';

class InputSection extends StatelessWidget {
  final String inputTitle;
  final String hintText;
  final TextInputType keyboardType;
  final String? suffixText;
  final String? initialValue;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  InputSection({
    Key? key,
    required this.inputTitle,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.suffixText,
    this.initialValue,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputTitle,
          style: TextStyle(color: TColor.themeColor, fontSize: 16),
        ),
        SizedBox(height: 5),
        CustomTextField(
          keyboardType: keyboardType,
          hintText: hintText,
          controller: controller,
          suffixText: suffixText,
          initialValue: initialValue,
          validator: validator,
        ),
      ],
    );
  }
}
