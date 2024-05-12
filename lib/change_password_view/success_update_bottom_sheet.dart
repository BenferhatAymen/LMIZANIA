import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';

class PasswordSuccessUpdateBottomSheet extends StatefulWidget {
  @override
  State<PasswordSuccessUpdateBottomSheet> createState() =>
      _PasswordSuccessUpdateBottomSheetState();
}

class _PasswordSuccessUpdateBottomSheetState
    extends State<PasswordSuccessUpdateBottomSheet> {
  late bool isFemale;
  @override
  void initState() {
    super.initState();
    isFemale = true;
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Icon(
            Icons.check_circle_outline_rounded,
            color: TColor.themeColor,
            size: 140,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Updated!",
            style: TextStyle(
              color: Color(0xff007B7F),
              fontSize: 36,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Your password has been updated \nsuccessfuly.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: media.width * 0.9,
            height: media.height * 0.08,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: TColor.themeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
