import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';

class TransactionsTextField extends StatelessWidget {
  const TransactionsTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Container(
      height: 65,
      child: TextField(
        style: TextStyle(color: Colors.black, fontSize: 20),
        decoration: InputDecoration(
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
          prefixIconConstraints: BoxConstraints(
            minWidth: 70,
            minHeight: 70,
          ),
          prefixIcon: Container(
            margin: EdgeInsets.only(left: 20, right: 5, top: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: TColor.themeColor.withOpacity(0.25),
            ),
            child: Icon(Icons.car_crash_outlined,
                color: TColor.themeColor, size: 25),
          ),
        ),
      ),
    );
  }
}
