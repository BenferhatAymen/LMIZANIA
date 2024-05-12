import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/utils/custom_colors.dart';
class CustomTextField extends StatelessWidget {
  final IconData? prefixIcon;
  final String hintText;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    this.prefixIcon,
    required this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: TextField(
        controller: controller,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, color: CustomColors.strong),
          labelText: hintText,
          labelStyle: TextStyle(color: CustomColors.strong),
          filled: true,
          fillColor: Color(0xff00494c).withOpacity(0.15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: CustomColors.strong),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
