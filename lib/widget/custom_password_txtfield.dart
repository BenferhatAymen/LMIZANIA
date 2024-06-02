import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/utils/custom_colors.dart';

class PasswordTextField extends StatefulWidget {
  final IconData? prefixIcon;
  final String hintText;
  final TextEditingController? controller;
  Function(String)? onChanged;
  String? Function(String?)? validator;

  PasswordTextField({
    Key? key,
    this.prefixIcon,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  bool _isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          prefixIcon: Icon(widget.prefixIcon,
              color: _isPasswordValid ? CustomColors.strong : Colors.red),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              !_isPasswordValid
                  ? Icons.info
                  : _obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
              color: !_isPasswordValid ? Colors.red : CustomColors.strong,
            ),
          ),
          labelText: widget.hintText,
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
            borderSide: BorderSide(
                color: !_isPasswordValid ? Colors.red : CustomColors.strong),
          ),
        ),
      ),
    );
  }
}
