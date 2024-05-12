import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmizania/utils/custom_colors.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final String textbtn;

  final VoidCallback onTap;

  const CustomRichText({
    Key? key,
    required this.text,
    required this.style,
    required this.onTap, required this.textbtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: style,
            ),
            TextSpan(
              text: textbtn,
              style: GoogleFonts.openSans(
                fontSize: 16.sp,
                color: CustomColors.strong,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            )
          ],
        ),
      ),
    );
  }
}
