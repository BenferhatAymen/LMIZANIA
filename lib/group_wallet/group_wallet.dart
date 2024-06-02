import 'package:flutter/material.dart';
import 'package:lmizania/add_goal/add_goal_screen.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/group_screen/group_screen.dart';
import 'package:lmizania/settings_view/settings_view.dart';
import 'package:lmizania/utils/Group_card.dart';
import 'package:lmizania/utils/segment_button.dart';
import 'package:lmizania/widget/text_alert_dialog.dart';

class GroupWalletView extends StatefulWidget {
  @override
  State<GroupWalletView> createState() => _GroupWalletViewState();
}

class _GroupWalletViewState extends State<GroupWalletView> {
  bool isPersonal = false;
  var groupsData = [
    {"name": "Family", "members": 5, "icon": "images/family.png"},
    {"name": "Friends", "members": 3, "icon": "images/friends.png"},
    {"name": "2cp4", "members": 20, "icon": "images/2cp5.png"},
    {"name": "2cp5", "members": 20, "icon": "images/2cp5.png"},
    {"name": "Estin Boys", "members": 16, "icon": "images/family.png"},
    {"name": "Chabiba", "members": "3", "icon": "images/2cp5.png"},
    {"name": "2cp4", "members": 20, "icon": "images/2cp5.png"},
    {"name": "2cp5", "members": 20, "icon": "images/2cp5.png"},
    {"name": "Estin Boys", "members": 16, "icon": "images/family.png"},
    {"name": "Chabiba", "members": "3", "icon": "images/2cp5.png"},
    {"name": "2cp4", "members": 20, "icon": "images/2cp5.png"},
    {"name": "2cp5", "members": 20, "icon": "images/2cp5.png"},
    {"name": "Estin Boys", "members": 16, "icon": "images/family.png"},
    {"name": "Chabiba", "members": "3", "icon": "images/2cp5.png"},
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Groups',
                    style: TextStyle(
                      color: TColor.themeColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return TextAlertDialog(
                            onSave: () {},
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.add_circle,
                      color: TColor.themeColor,
                      size: 32,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: groupsData.length,
                itemBuilder: (context, index) {
                  var sObject = groupsData[index] as Map<String, dynamic>;

                  return GroupCard(
                    groupData: sObject,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GroupScreenView()));
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
