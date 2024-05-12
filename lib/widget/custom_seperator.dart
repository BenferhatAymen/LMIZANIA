import 'package:flutter/material.dart';
import 'package:lmizania/utils/custom_colors.dart';

class CustomSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: CustomColors.btnColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'or',
            style: TextStyle(fontSize: 16, color: CustomColors.btnColor),
          ),
        ),
        Expanded(
          child: Divider(
            color: CustomColors.btnColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
