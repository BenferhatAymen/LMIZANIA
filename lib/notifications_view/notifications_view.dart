import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/utils/filter_row.dart';
import 'package:lmizania/utils/group_card.dart';
import 'package:lmizania/utils/group_settings_card.dart';
import 'package:lmizania/utils/segment_button.dart';
import 'package:lmizania/utils/transaction_card.dart';
import 'package:lmizania/utils/transaction_section.dart';

class NotificationsSettingsView extends StatefulWidget {
  @override
  State<NotificationsSettingsView> createState() =>
      _NotificationsSettingsViewState();
}

class _NotificationsSettingsViewState extends State<NotificationsSettingsView> {
  @override
  List<Map<String, dynamic>> notificationMaps = [
    {
      "notification_name": "Due dates",
      "is_selected": true,
      "notification_description":
          "When it’s time to pay a bill \nor to pay back a loan",
    },
    {
      "notification_name": "Goals",
      "is_selected": true,
      "notification_description": "When you achieve a goal  \n(group/personal)",
    },
    {
      "notification_name": "Tips & Articles",
      "is_selected": false,
      "notification_description":
          "Small & useful pieces of pratical \nfinancial advice"
    },
    {
      "notification_name": "Zakat Reminded",
      "is_selected": true,
      "notification_description":
          "When a moon year passes and \nyou have to pay zakat"
    }
  ];

  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xff00494C).withOpacity(0.95),
        title: Text(
          'Notifications Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: notificationMaps.length,
                itemBuilder: (context, index) {
                  return NotificationRow(
                    notificationName: notificationMaps[index]
                        ["notification_name"],
                    notificationDescription: notificationMaps[index]
                        ["notification_description"],
                    isSelected: notificationMaps[index]["is_selected"],
                    onTap: (value) {
                      setState(() {
                        notificationMaps[index]["is_selected"] = value;
                      });
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationRow extends StatelessWidget {
  NotificationRow(
      {super.key,
      required this.notificationName,
      required this.isSelected,
      required this.notificationDescription,
      this.onTap});
  String notificationName;
  String notificationDescription;

  bool isSelected;
  void Function(bool value)? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notificationName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    notificationDescription,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Spacer(),
              CupertinoSwitch(
                value: isSelected,
                onChanged: onTap,
                activeColor: TColor.themeColor,
                trackColor: TColor.themeColor.withOpacity(0.2),
              ),
            ]),
            Divider(
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}
