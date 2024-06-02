import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/cubits/add_goal/add_goal_cubit.dart';
import 'package:lmizania/update_states.dart';
import 'package:lmizania/utils/basic_imports.dart';
import 'package:lmizania/utils/custom_text_field.dart';
import 'package:lmizania/utils/filter_row.dart';
import 'package:lmizania/utils/group_card.dart';
import 'package:lmizania/utils/group_settings_card.dart';
import 'package:lmizania/utils/input_section.dart';
import 'package:lmizania/utils/segment_button.dart';
import 'package:lmizania/utils/transaction_card.dart';
import 'package:lmizania/utils/transaction_section.dart';

class AddPersonalGoal extends StatefulWidget {
  @override
  State<AddPersonalGoal> createState() => _AddPersonalGoalState();
}

class _AddPersonalGoalState extends State<AddPersonalGoal> {
  XFile? image;
  String? downloadURL;
  final TextEditingController goalNameController = TextEditingController();
  final TextEditingController goalPriceController = TextEditingController();
  final TextEditingController goalDescriptionController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bgColor,
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xff00494C).withOpacity(0.95),
        title: Text(
          'Add Goal',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    ImagePicker imagePicker = ImagePicker();
                    image = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {});
                    String uniqueId =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    Reference referenceImageDir =
                        FirebaseStorage.instance.ref().child("goal_images");
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
                  child: image == null
                      ? Container(
                          alignment: Alignment.center,
                          height: media.width * 0.82,
                          width: media.width * 0.82,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: TColor.themeColor.withOpacity(0.5),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "images/Vector.png",
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Add a photo of your goal",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          height: media.width * 0.82,
                          width: media.width * 0.82,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: TColor.themeColor.withOpacity(0.5),
                            ),
                            image: DecorationImage(
                              image: FileImage(File(image!.path)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: 15,
                ),
                InputSection(
                  inputTitle: "Goal name",
                  hintText: "Write your goal name",
                  controller: goalNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a goal name';
                    }
                    return null;
                  },
                ),
                InputSection(
                  inputTitle: "Goal price",
                  hintText: "Write your goal price",
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: goalPriceController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a goal price';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid integer';
                    }
                    return null;
                  },
                ),
                InputSection(
                  inputTitle: "Goal description",
                  hintText: "Write your goal description",
                  keyboardType: TextInputType.multiline,
                  controller: goalDescriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a goal description';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              print(goalPriceController.text);
                              BlocProvider.of<AddGoalCubit>(context).addGoal(
                                name: goalNameController.text,
                                targetAmount:
                                    int.parse(goalPriceController.text) ?? 150,
                                description: goalDescriptionController.text,
                                image: downloadURL ?? "noimage",
                              );
                              await Future.delayed(Duration(milliseconds: 200));
                              updateGoalsScreen(context);
                              updateHomeScreen(context);

                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: TColor.themeColor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.black.withOpacity(0.25),
                                  width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              Text(
                                "Discard",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.black.withOpacity(0.25),
                                  width: 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
