 import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: TColor.themeColor, content: Text(message)));
}
