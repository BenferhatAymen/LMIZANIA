import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:lmizania/change_password_view/success_update_bottom_sheet.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/utils/filter_row.dart';
import 'package:lmizania/utils/group_card.dart';
import 'package:lmizania/utils/group_settings_card.dart';
import 'package:lmizania/utils/segment_button.dart';
import 'package:lmizania/utils/transaction_card.dart';
import 'package:lmizania/utils/transaction_section.dart';

class ChangePasswordView extends StatefulWidget {
  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  TextEditingController passwordController = TextEditingController();
  List<bool> successConditions = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bgColor,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xff00494C).withOpacity(0.95),
        title: Text(
          'Change Password',
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
          child: SizedBox(
            height: media.height * 0.84,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                ChangePasswordInputSection(
                    inputTitle: "Old Password",
                    hintText: "Enter old password",
                    prefixIcon: Icons.lock),
                ChangePasswordInputSection(
                  inputTitle: "New Password",
                  hintText: "Enter new password",
                  controller: passwordController,
                  prefixIcon: Icons.lock,
                  onChanged: (value) {
                    if (passwordController.text.length >= 8) {
                      successConditions[0] = true;
                    } else {
                      successConditions[0] = false;
                    }
                    if (passwordController.text.contains(RegExp(r'[A-Z]'))) {
                      successConditions[1] = true;
                    } else {
                      successConditions[1] = false;
                    }

                    if (passwordController.text.contains(RegExp(r'[0-9]'))) {
                      successConditions[2] = true;
                    } else {
                      successConditions[2] = false;
                    }
                    if (passwordController.text
                        .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      successConditions[3] = true;
                    } else {
                      successConditions[3] = false;
                    }
                    setState(() {});
                  },
                ),
                Row(
                  children: [
                    if (passwordController.text.length == 0)
                      SizedBox(
                        width: 10,
                      ),
                    if (passwordController.text.length > 0)
                      for (bool value in successConditions)
                        if (value == true)
                          Expanded(
                            child: Container(
                              height: media.height * 0.007,
                              margin: EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                color: Colors.green,
                              ),
                            ),
                          ),
                    if (passwordController.text.length > 0)
                      for (bool value in successConditions)
                        if (value == false)
                          Expanded(
                            child: Container(
                              height: media.height * 0.007,
                              margin: EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                              ),
                            ),
                          ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                ChangePasswordInputSection(
                    inputTitle: "Confirm new Password",
                    hintText: "Confirm new password",
                    prefixIcon: Icons.lock),
                Spacer(),
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
                                  child: PasswordSuccessUpdateBottomSheet(),
                                ),
                              ),
                          isScrollControlled: true);
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
      ),
    );
  }
}

class ChangePasswordInputSection extends StatefulWidget {
  ChangePasswordInputSection(
      {super.key,
      required this.inputTitle,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.suffixIcon,
      this.initialValue,
      required this.prefixIcon,
      this.controller,
      this.onChanged});
  String inputTitle;
  String hintText;
  TextInputType keyboardType;
  String? initialValue;
  String? suffixIcon;
  IconData prefixIcon;
  TextEditingController? controller;
  void Function(String)? onChanged;

  @override
  State<ChangePasswordInputSection> createState() =>
      _ChangePasswordInputSectionState();
}

class _ChangePasswordInputSectionState
    extends State<ChangePasswordInputSection> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.inputTitle,
            style: TextStyle(
                color: TColor.themeColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 50,
            child: TextFormField(
              onChanged: widget.onChanged,
              controller: widget.controller,
              style: TextStyle(
                  color: TColor.themeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              keyboardType: widget.keyboardType,
              initialValue: widget.initialValue ?? null,
              obscureText: obsecureText,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: TColor.themeColor.withOpacity(0.65),
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
                contentPadding: EdgeInsets.only(left: 30),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: TColor.themeColor.withOpacity(0.5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: TColor.themeColor.withOpacity(0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: TColor.themeColor.withOpacity(0.5),
                  ),
                ),
                prefixIcon: Icon(
                  widget.prefixIcon,
                  color: TColor.themeColor,
                  size: 24,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obsecureText = !obsecureText;
                    });
                  },
                  child: Icon(
                      obsecureText
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: TColor.themeColor,
                      size: 28),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
