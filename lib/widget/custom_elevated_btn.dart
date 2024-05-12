import 'package:flutter/material.dart';
import 'package:lmizania/utils/custom_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isValid; // New parameter to accept isValid boolean

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isValid, // Accept isValid boolean as a parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: isValid ? onPressed : null, // Use isValid to determine onPressed callback
        style: ElevatedButton.styleFrom(
          backgroundColor: isValid ? CustomColors.btnColor : CustomColors.subtextGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        child: Text(
          text,
          style: TextStyle(color: CustomColors.white),
        ),
      ),
    );
  }
}
