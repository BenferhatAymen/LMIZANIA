import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/group_settings/group_setting_view.dart';

class GroupSettingsCard extends StatelessWidget {
  Map<String, dynamic> groupData;

  GroupSettingsCard({super.key, required this.groupData});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
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
          GestureDetector(
            // Todo : implement navigation to group settings
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GroupSettingsView(),
                ),
              );
            },
            child: Icon(
              Icons.settings,
              color: TColor.themeColor,
              size: 26,
            ),
          )
        ],
      ),
    );
  }
}
