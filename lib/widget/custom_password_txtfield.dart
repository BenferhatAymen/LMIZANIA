import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/utils/custom_colors.dart';

class PasswordTextField extends StatefulWidget {
  final IconData? prefixIcon;
  final String hintText;
  final TextEditingController? controller;

  const PasswordTextField({
    Key? key,
    this.prefixIcon,
    required this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  RegExp _passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  bool _isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        onChanged: (value) {
          setState(() {
            _isPasswordValid = _passwordRegExp.hasMatch(value);
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(widget.prefixIcon, color: _isPasswordValid ? CustomColors.strong : Colors.red),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              !_isPasswordValid? Icons.info: _obscureText ? Icons.visibility_off : Icons.visibility,
              color: !_isPasswordValid? Colors.red: CustomColors.strong,
            ),
          ),
          labelText: widget.hintText,
          labelStyle: TextStyle(color: CustomColors.strong),
       //   errorText: _isPasswordValid ? null : 'Password must contain at least 1 uppercase, 1 lowercase, 1 digit, and be at least 8 characters long',
          filled: true,
          fillColor: Color(0xff00494c).withOpacity(0.15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide( color: CustomColors.strong ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide( color: !_isPasswordValid?Colors.red:  CustomColors.strong ),
          ),
        ),
      ),
    );
  }
}
