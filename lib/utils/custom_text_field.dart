import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hintText = "",
      this.keyboardType = TextInputType.text,
      this.initialValue,
      this.suffixText});
  String hintText;
  TextInputType keyboardType;
  String? initialValue;
  String? suffixText;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Container(
      height: 60,
      child: TextFormField(
        expands: true,
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
        keyboardType: keyboardType,
        initialValue: initialValue ?? null,
        maxLines: null,
        maxLength: null,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.4),
              fontSize: 15,
              fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.only(left: 30),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: TColor.themeColor.withOpacity(0.5),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: TColor.themeColor.withOpacity(0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: TColor.themeColor.withOpacity(0.5),
            ),
          ),
          suffixIcon: suffixText != null
              ? Container(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  child: Text(
                    "DA ",
                    style: TextStyle(
                      color: TColor.themeColor.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
