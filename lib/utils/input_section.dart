import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/utils/custom_text_field.dart';

class InputSection extends StatelessWidget {
  InputSection(
      {super.key,
      required this.inputTitle,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.suffixText,
      this.initialValue});
  String inputTitle;
  String hintText;
  TextInputType keyboardType;
  String? initialValue;
  String? suffixText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputTitle,
          style: TextStyle(color: TColor.themeColor, fontSize: 16),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          keyboardType: keyboardType,
          hintText: hintText,
          initialValue: initialValue,
          suffixText: suffixText,
        ),
      ],
    );
  }
}
