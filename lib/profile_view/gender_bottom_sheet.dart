import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';

class GenderBottomSheet extends StatefulWidget {
  @override
  State<GenderBottomSheet> createState() => _GenderBottomSheetState();
}

class _GenderBottomSheetState extends State<GenderBottomSheet> {
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Gender',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GenderRow(
            gender: "Male",
            isSelected: !isFemale,
            onTap: () {
              setState(() {
                isFemale = false;
              });
            },
          ),
          SizedBox(
            height: 6,
          ),
          Divider(
            color: Colors.black.withOpacity(0.2),
          ),
          GenderRow(
            gender: "Female",
            isSelected: isFemale,
            onTap: () {
              setState(() {
                isFemale = true;
              });
            },
          ),
          SizedBox(
            height: 15,
          ),
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

class GenderRow extends StatelessWidget {
  GenderRow(
      {super.key, required this.gender, required this.isSelected, this.onTap});
  String gender;
  bool isSelected;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(children: [
          Text(
            gender,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Icon(
            isSelected ? Icons.check_circle_rounded : null,
            color: Color(0xff5233FF),
            size: 30,
          ),
        ]),
      ),
    );
  }
}
