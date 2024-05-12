import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/group_settings/add_adming_screen.dart';
import 'package:lmizania/group_settings/remove_member_screen.dart';
import 'package:lmizania/utils/group_card.dart';
import 'package:lmizania/utils/group_settings_card.dart';
import 'package:lmizania/utils/segment_button.dart';
import 'package:lmizania/utils/transaction_card.dart';
import 'package:lmizania/utils/transaction_section.dart';

class GroupSettingsView extends StatefulWidget {
  @override
  State<GroupSettingsView> createState() => _GroupSettingsViewState();
}

class _GroupSettingsViewState extends State<GroupSettingsView> {
  bool isPersonal = true;
  var userData = [
    {"name": "Susan", "icon": "images/suzan.png"},
    {"name": "Roney", "icon": "images/roney.png"},
    {"name": "Smith", "icon": "images/smith.png"},
    {"name": "Karim lgang", "icon": "images/roney.png"},
    {"name": "Fethi jamal", "icon": "images/smith.png"},
    {"name": "Fadi ronaldo", "icon": "images/roney.png"},
    {"name": "akram djanit", "icon": "images/smith.png"},
  ];
  var adminData = [
    {"name": "Hadjaymen", "icon": "images/aymen.png"},
    {"name": "Bilel Abbes", "icon": "images/bilel.png"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bgColor,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xff00494C).withOpacity(0.95),
        title: Text(
          'Group Settings',
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                'Group photo : ',
                style: TextStyle(
                  color: TColor.themeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                padding: EdgeInsets.all(0.8),
                decoration: BoxDecoration(
                  color: TColor.themeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "images/family.png",
                    width: media.width * 0.9,
                    height: media.height * 0.35,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Admins:',
                          style: TextStyle(
                            color: TColor.themeColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: AddAdminScreen(),
                                      ),
                                    ),
                                isScrollControlled: true);
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
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: adminData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin:
                                EdgeInsets.only(top: 8, bottom: 8, right: 15),
                            child: UserWidget(adminData: adminData[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Members:',
                          style: TextStyle(
                            color: TColor.themeColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: RemoveMemberScreen(),
                                      ),
                                    ),
                                isScrollControlled: true);
                          },
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: userData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin:
                                EdgeInsets.only(top: 8, bottom: 8, right: 15),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage(userData[index]["icon"]!),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  userData[index]["name"]!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
    required this.adminData,
  });

  final Map<String, String> adminData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(adminData["icon"]!),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          adminData["name"]!,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
