import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:lmizania/change_password_view/change_password_view.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/currency_conversion_view/currency_conversion.dart';
import 'package:lmizania/notifications_view/notifications_view.dart';
import 'package:lmizania/profile_view/profile_view.dart';
import 'package:lmizania/settings_view/logout_bottom_sheet.dart';
import 'package:lmizania/utils/filter_row.dart';
import 'package:lmizania/utils/group_card.dart';
import 'package:lmizania/utils/group_settings_card.dart';
import 'package:lmizania/utils/segment_button.dart';
import 'package:lmizania/utils/transaction_card.dart';
import 'package:lmizania/utils/transaction_section.dart';
import 'package:lmizania/notifications_show/notifications_show_view.dart';

class SettingsView extends StatefulWidget {
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isPersonal = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bgColor,
      appBar: AppBar(
        backgroundColor: Color(0xff00494C).withOpacity(0.95),
        title: Text(
          'Settings',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              SettingSection(
                title: "Account",
                widgetList: [
                  SettingsRow(
                    settingName: "Edit profile",
                    settingIcon: Icons.person,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileView(),
                        ),
                      );
                    },
                  ),
                  SettingsRow(
                    settingName: "Change password",
                    settingIcon: Icons.lock,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePasswordView(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SettingSection(
                title: "Preferences",
                widgetList: [
                  SettingsRow(
                    settingName: "Currency conversion",
                    settingIcon: Icons.attach_money,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CurrencyConversionView(),
                        ),
                      );
                    },
                  ),
                  SettingsRow(
                    settingName: "Notifications settings",
                    settingIcon: Icons.edit_notifications,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsSettingsView(),
                        ),
                      );
                    },
                  ),
                  SettingsRow(
                    settingName: "Notifications",
                    settingIcon: Icons.notifications,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsShowView(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SettingSection(
                title: "Others",
                widgetList: [
                  SettingsRow(
                    settingName: "Privacy policy",
                    settingIcon: Icons.privacy_tip,
                  ),
                  SettingsRow(
                    settingName: "Terms and conditions",
                    settingIcon: Icons.person_search,
                  ),
                ],
              ),
              SizedBox(
                width: media.width * 0.9,
                height: media.height * 0.08,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: LogOutBottomSheet(),
                              ),
                            ),
                        isScrollControlled: true);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        size: 25,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Log out",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: Colors.red,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
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

class SettingsRow extends StatelessWidget {
  VoidCallback? onTap;

  SettingsRow(
      {super.key,
      required this.settingName,
      required this.settingIcon,
      this.onTap});
  String settingName;
  IconData settingIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          children: [
            Icon(
              settingIcon,
              size: 25,
              color: TColor.themeColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              settingName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: TColor.themeColor,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingSection extends StatelessWidget {
  SettingSection({super.key, required this.title, required this.widgetList});
  List<Widget> widgetList = [];
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: TColor.themeColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          for (Widget widget in widgetList) widget,
        ],
      ),
    );
  }
}
