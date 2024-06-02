import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lmizania/cubits/deposit_goal_cubit/deposit_goal_cubit.dart';
import 'package:lmizania/cubits/get_all_goals_cubit/get_all_goals_cubit.dart';
import 'package:lmizania/data/models/goal_model.dart';
import 'package:lmizania/screens/edit_persona_goal.dart';
import 'package:lmizania/update_states.dart';
import 'package:lmizania/utils/desposit_alert_dialog.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../colors.dart';
import '../model/goal_model.dart';
import '../utils/basic_imports.dart';
import 'dart:math';

class GoalListItem extends StatelessWidget {
  final GoalModel goal;
  final int index;
  final List<Color> progressBarColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
  ];

  GoalListItem({
    Key? key,
    required this.goal,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorIndex = index % progressBarColors.length;
    final progressBarColor = progressBarColors[colorIndex];
    int depositAmount = 0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditPersonalGoalScreen(goal: goal,),
          ),
        );
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
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 26,
                ),
                title: Text(
                  goal.name!,
                  style: TextStyle(
                    color: TColor.themeColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  "Duration : 3 months",
                  style: TextStyle(fontSize: 12.sp),
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.btnColor,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DepositAlertDialog(
                          onSave: () async {
                            BlocProvider.of<DepositGoalCubit>(context)
                                .depositGoal(
                                    id: goal.id!, amount: depositAmount);
                            await Future.delayed(Duration(milliseconds: 200));
                            updateGoalsScreen(context);
                            updateTotalBalanceComponent(context);
                            Navigator.pop(context);
                          },
                          onChanged: (data) {
                            try {
                              depositAmount = int.parse(data);
                            } catch (e) {
                              depositAmount = 0;
                            }
                          },
                          validator: (data) {
                            if (data!.isEmpty) {
                              return "Field is empty";
                            }
                            try {
                              int deposit = int.parse(data);
                              if (goal.currentAmount! + deposit >
                                  goal.targetAmount!) {
                                return "Please reduce the deposit amount.";
                              }
                            } catch (e) {
                              return "Invalid number format.";
                            }
                            return null;
                          },
                        );
                      },
                    );
                  },
                  child: Text(
                    'Deposit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.headingTextSize3,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                  '${((goal.currentAmount! / goal.targetAmount!) * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    color: progressBarColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: LinearProgressIndicator(
                      value: goal.currentAmount! / goal.targetAmount!,
                      minHeight: 28,
                      backgroundColor: Colors.grey,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(progressBarColor),
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Text(
                        "${NumberFormat('#,###').format(goal.currentAmount)} DA",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${NumberFormat('#,###').format(goal.targetAmount!)} DA',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
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
