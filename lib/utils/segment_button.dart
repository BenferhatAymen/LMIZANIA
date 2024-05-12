import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';

class SegmentButton extends StatelessWidget {
  SegmentButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isActive});
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Builder(builder: (context) {
        return Container(
          height: 54,
          width: media.width * 0.43,
          decoration: BoxDecoration(
            color: isActive ? TColor.themeColor : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white : TColor.themeColor,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        );
      }),
    );
  }
}
