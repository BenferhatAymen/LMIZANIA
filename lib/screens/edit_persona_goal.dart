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

class EditPersonalGoalScreen extends StatefulWidget {
  @override
  State<EditPersonalGoalScreen> createState() => _EditPersonalGoalScreenState();
}

class _EditPersonalGoalScreenState extends State<EditPersonalGoalScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bgColor,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xff00494C).withOpacity(0.95),
        title: Text(
          'Edit Goal',
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
                  image: DecorationImage(
                    image: AssetImage(
                      "images/laptop.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(
                    width: 2,
                    color: TColor.themeColor.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InputSection(
                  inputTitle: "Goal name",
                  hintText: "Write your goal name",
                  initialValue: "Laptop"),
              InputSection(
                inputTitle: "Goal price",
                hintText: "Write your goal price",
                keyboardType: TextInputType.numberWithOptions(),
                suffixText: "DA",
                initialValue: "140000",
              ),
              InputSection(
                inputTitle: "Goal description",
                hintText: "Write your goal description",
                keyboardType: TextInputType.multiline,
                initialValue:
                "ASUS CREATOR LAPTOP Q OLED that has 16 ram, 512 ssd, gtx 1050 graphics, 14’ screen.",
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
                          "Save",
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
                              "Delete",
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
