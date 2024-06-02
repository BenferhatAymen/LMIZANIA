import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/utils/custom_colors.dart';

class CustomTextField extends StatelessWidget {
  final IconData? prefixIcon;
  final String hintText;
  final TextEditingController? controller;

  Function(String)? onChanged;
  String? Function(String?)? validator;

   CustomTextField({
    Key? key,
    this.prefixIcon,
    required this.hintText,
    this.controller,
  this.onChanged ,  this.validator 

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        obscureText: false,
        validator:validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          prefixIcon: Icon(prefixIcon, color: CustomColors.strong),
          labelText: hintText,
          labelStyle: TextStyle(color: CustomColors.strong),
          filled: true,
          fillColor: Color(0xff00494c).withOpacity(0.15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: CustomColors.strong),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 1),
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
