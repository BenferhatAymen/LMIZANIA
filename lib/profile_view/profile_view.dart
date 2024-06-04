import 'dart:ffi';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:lmizania/cubits/get_profile_cubit/get_profile_cubit.dart';
import 'package:lmizania/data/models/user_model.dart';
import 'package:lmizania/profile_view/gender_bottom_sheet.dart';
import 'package:lmizania/utils/custom_text_field.dart';
import 'package:lmizania/utils/filter_row.dart';
import 'package:lmizania/utils/group_card.dart';
import 'package:lmizania/utils/group_settings_card.dart';
import 'package:lmizania/utils/segment_button.dart';
import 'package:lmizania/utils/transaction_card.dart';
import 'package:lmizania/utils/transaction_section.dart';

class EditProfileView extends StatefulWidget {
  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  bool isProfileLoaded = false; // Add a flag to check if profile is loaded

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    BlocProvider.of<GetProfileCubit>(context).getProfile();
  }

  XFile? image;
  String? downloadURL;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bgColor,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xff00494C).withOpacity(0.95),
        title: Text(
          'Edit Profile',
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
            child: BlocBuilder<GetProfileCubit, GetProfileState>(
              builder: (context, state) {
                if (state is GetProfileLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is GetProfileSuccess) {
                  if (!isProfileLoaded) {
                    UserModel user = state.user;
                    _nameController.text = user.firstName!;
                    _emailController.text = user.email!;
                    isProfileLoaded =
                        true; // Set flag to true after loading profile
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () async {
                          ImagePicker imagePicker = ImagePicker();
                          image = await imagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {});
                          String uniqueId =
                              DateTime.now().millisecondsSinceEpoch.toString();
                          Reference referenceImageDir = FirebaseStorage.instance
                              .ref()
                              .child("goal_images");
                          Reference fileRef = referenceImageDir.child(uniqueId);
                          try {
                            await fileRef.putFile(File(image!.path));
                            downloadURL = await fileRef.getDownloadURL();
                            print(downloadURL ?? "no url");
                          } catch (e) {
                            print(downloadURL ?? "no url");

                            print(e);
                          }
                        },
                        child: Stack(
                          children: [
                            downloadURL != null
                                ? Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(downloadURL!),
                                        fit: BoxFit.cover,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                : state.user.image != null
                                    ? Container(
                                        height: 130,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                NetworkImage(state.user.image!),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      )
                                    : Container(
                                        height: 130,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.person,
                                          color: TColor.themeColor,
                                          size: 100,
                                        ),
                                      ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: TColor.themeColor,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      ProfileInputSection(
                        inputTitle: "Full Name",
                        hintText: "Enter your full name",
                        prefixIcon: Icons.person,
                        controller: _nameController,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      ProfileInputSection(
                        inputTitle: "Email",
                        hintText: "Enter your full name",
                        prefixIcon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      Spacer(),
                      SizedBox(
                        width: media.width * 0.9,
                        height: media.height * 0.08,
                        child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<EditProfileCubit>(context)
                                .editProfile(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    gender: isMale ? "Male" : "Female",
                                    image: downloadURL);
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
                  );
                } else {
                  return Text("Cannot get Profile Data");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class InputSectionGestureDetector extends StatelessWidget {
  InputSectionGestureDetector({
    super.key,
    this.onTap,
    required this.inputTitle,
    required this.contentText,
  });

  VoidCallback? onTap;
  String inputTitle;
  String contentText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inputTitle,
            style: TextStyle(
                color: TColor.themeColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            padding: EdgeInsets.only(left: 9, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: TColor.themeColor.withOpacity(0.5),
              ),
            ),
            height: 50,
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: TColor.themeColor,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  contentText,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInputSection extends StatelessWidget {
  ProfileInputSection(
      {super.key,
      required this.inputTitle,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.suffixText,
      this.initialValue,
      required this.prefixIcon,
      this.controller,
      this.validator});
  String inputTitle;
  String hintText;
  TextInputType keyboardType;
  String? initialValue;
  String? suffixText;
  IconData prefixIcon;
  TextEditingController? controller;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputTitle,
          style: TextStyle(
              color: TColor.themeColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          child: TextFormField(
            validator: validator,
            controller: controller,
            expands: true,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
            keyboardType: keyboardType,
            initialValue: initialValue ?? null,
            maxLines: null,
            maxLength: null,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.4),
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
                prefixIcon,
                color: TColor.themeColor,
                size: 30,
              ),
            ),
          ),
        )
      ],
    );
  }
}
