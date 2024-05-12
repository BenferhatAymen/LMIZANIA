import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lmizania/screens/edit_persona_goal.dart';
import 'package:lmizania/utils/desposit_alert_dialog.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../colors.dart';
import '../model/goal_model.dart';
import '../utils/basic_imports.dart';

class GoalListItem extends StatelessWidget {
  final Goal goal;
  final List<Color> progressBarColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
    // Add more colors as needed
  ];

  GoalListItem({
    Key? key,
    required this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine the color index based on the index of the goal in the list
    final colorIndex = goal.index % progressBarColors.length;
    final progressBarColor = progressBarColors[colorIndex];

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditPersonalGoalScreen()));
      },
      child: Card(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 20, right: 18, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                minVerticalPadding: 2,
                leading: goal.image != null
                    ?  CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 26,
                  backgroundImage: AssetImage(goal.image!),
                ):
                    CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 26,
                ),
                title: Text(goal.title,  style: TextStyle(
                    color: TColor.themeColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),),
                subtitle: Text("Duration :${goal.duration}"),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.btnColor,

                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DepositAlertDialog(onSave: (){},);
                      },
                    );
                  },
                  child: Text('Deposit', style: TextStyle(color: Colors.white, fontSize: Dimensions.headingTextSize3),),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                  '${(goal.progressPercentage * 100).toStringAsFixed(0)}%',
                  style: TextStyle(color: progressBarColor, fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: LinearProgressIndicator(
                      value: 0.8,
                      minHeight: 28,
                      backgroundColor: Colors.grey,
                      valueColor:
                      AlwaysStoppedAnimation<Color>(progressBarColor),
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Text(
                        "${NumberFormat('#,###').format(goal.depositedAmount)} DA",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:5 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Ammount',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),),
                    Text('${NumberFormat('#,###').format(goal.totalSavings)} DA',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class DepositDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingSize),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Deposit',
                style: CustomStyle.strongTextStyle,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40.h,
              child: Card(
                elevation: 0,
                color: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            filled: true,
                            hintText: '50 000',
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 12.sp,
                            ),
                            fillColor: Colors.grey.shade100,
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const Text('DA', style: TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                      ),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.heightSizelarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.btnColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        )
                    ),
                    onPressed: () {
                      // Handle save
                    },
                    child: Text('Save', style: TextStyle(color: Colors.white, fontSize: Dimensions.headingTextSize3),),
                  ),
                ),
                SizedBox(width: Dimensions.widthSize),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      side: BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                    onPressed: () {
                      // Handle cancel
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel', style: TextStyle(color: Colors.red),),),
                ),
              ],
            ),
            Text(
              'Note',
              style: TextStyle(fontSize: Dimensions.headingTextSize4, fontWeight: FontWeight.w400, color: CustomColors.red),
            ),
            Text(
              'The deposit you make will be deducted from your total balance',
              style: GoogleFonts.openSans(
                    color: CustomColors.subtextGrey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
