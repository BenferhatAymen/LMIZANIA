import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';
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
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: media.width * 0.9,
                width: media.width * 0.9,
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
                    // RotatedBox(
                    //   quarterTurns: 2,
                    //   child: Icon(
                    //     Icons.attach_file_rounded,
                    //     size: 100,
                    //     color: TColor.themeColor.withOpacity(0.6),
                    //   ),
                    // ),
                    Image.asset(
                      "images/Vector.png",
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Add a photo of your goal",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InputSection(
                  inputTitle: "Goal name", hintText: "Write your goal name"),
              InputSection(
                inputTitle: "Goal price",
                hintText: "Write your goal price",
                keyboardType: TextInputType.numberWithOptions(),
              ),
              InputSection(
                inputTitle: "Goal description",
                hintText: "Write your goal description",
                keyboardType: TextInputType.multiline,
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
                        onPressed: () {
                          Navigator.pop(context);
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
    );
  }
}
