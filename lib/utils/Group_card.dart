import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';

class GroupCard extends StatelessWidget {
  Map<String, dynamic> groupData;
  VoidCallback onTap;

  GroupCard({super.key, required this.groupData, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(groupData['icon']),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              groupData["name"],
              style: TextStyle(
                color: TColor.themeColor,
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Text(
              '${groupData["members"]} members',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
