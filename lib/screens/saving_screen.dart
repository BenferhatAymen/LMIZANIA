import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/cubits/deposit_savings/deposit_savings_cubit.dart';
import 'package:lmizania/cubits/get_savings_cubit/get_savings_cubit.dart';
import 'package:lmizania/cubits/set_savings/set_savings_cubit.dart';
import 'package:lmizania/data/models/savings_model.dart';
import 'package:lmizania/update_states.dart';
import 'package:lmizania/utils/basic_imports.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/desposit_alert_dialog.dart';
import '../widget/custom_appbar.dart';
import '../widget/goals_list.dart';
import '../widget/saving_Container.dart';
import '../widget/target_dialog_box.dart';

class Savings extends StatefulWidget {
  Savings({Key? key}) : super(key: key);

  @override
  State<Savings> createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  String daText = 'DA';
  bool _isFirstGradient = true;
  int balance = 5200000;
  int savingAmount = 4800;
  int depositAmount = 0;
  final TextEditingController _controller = TextEditingController();
  int changeTargetAmount = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bg,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: CustomAppBar(
          onBack: () {
            // Handle back button press
          },
          text: 'Savings',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSize),
          child: BlocBuilder<GetSavingsCubit, GetSavingsState>(
            builder: (context, state) {
              if (state is GetSavingsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is GetSavingsSuccess) {
                SavingsModel savings = state.savings;

                _controller.text = savings.targetAmount.toString();
                return Column(
                  children: [
                    SavingContainer(
                        savings: savings.currentAmount!,
                        isFirstGradient: _isFirstGradient),
                    SizedBox(height: Dimensions.heightSize),
                    Container(
                      padding: EdgeInsets.all(Dimensions.paddingSize),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Saving Progress',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: CustomColors.strong,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 48.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.btnColor,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DepositAlertDialog(
                                          onSave: () async {
                                            BlocProvider.of<
                                                        DepositSavingsCubit>(
                                                    context)
                                                .DepositSavings(
                                                    amount: depositAmount);

                                            await Future.delayed(
                                                Duration(milliseconds: 200));
                                            updateGoalsScreen(context);
                                            updateTotalBalanceComponent(
                                                context);
                                            Navigator.pop(context);
                                            BlocProvider.of<GetSavingsCubit>(
                                                    context)
                                                .getSavings();
                                          },
                                          title: "Deposit Savings",
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
                                              if (deposit +
                                                      savings.currentAmount! >
                                                  savings.targetAmount!) {
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
                                        fontSize: Dimensions.headingTextSize5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Center(
                            child: CircularPercentIndicator(
                              radius: 85.r,
                              lineWidth: 20.w,
                              percent: savings.currentAmount! /
                                  savings.targetAmount!,
                              center: Text(
                                  NumberFormat('#,###')
                                          .format(savings.currentAmount) +
                                      ' DA',
                                  style: GoogleFonts.openSans(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  )),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: CustomColors.yellowColor,
                            ),
                          ),
                          Text(
                            'Target',
                            style: TextStyle(
                                fontSize: 18,
                                color: TColor.themeColor,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 50,
                            child: Card(
                              elevation: 0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: BorderSide(
                                    color: TColor.themeColor.withOpacity(
                                        0.5)), // Adding black border color
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.r),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller: _controller,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8.0),
                                          filled: true,
                                          hintText:
                                              savings.targetAmount!.toString(),
                                          hintStyle: GoogleFonts.openSans(
                                            fontSize: 16.sp,
                                          ),
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                        ),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Text(
                                      daText,
                                      style: TextStyle(
                                        color: Color(0xff00494c80)
                                            .withOpacity(0.5),
                                        fontSize: 16,
                                      ),
                                    ), // Always present at the right side
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Text("Error");
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(16.5),
          child: targetButton()),
    );
  }

  ElevatedButton targetButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.btnColor,
          foregroundColor: CustomColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return DepositAlertDialog(
              title: "Change Target",
              onSave: () async {
                BlocProvider.of<SetSavingsCubit>(context)
                    .SetSavings(amount: changeTargetAmount);

                await Future.delayed(Duration(milliseconds: 200));
                updateGoalsScreen(context);
                updateTotalBalanceComponent(context);
                Navigator.pop(context);
                BlocProvider.of<GetSavingsCubit>(context).getSavings();
              },
              onChanged: (data) {
                try {
                  changeTargetAmount = int.parse(data);
                } catch (e) {
                  changeTargetAmount = 0;
                }
              },
              validator: (data) {
                if (data!.isEmpty) {
                  return "Field is empty";
                }
                try {
                  int changeTargetAmount = int.parse(data);
                } catch (e) {
                  return "Invalid number format.";
                }
                return null;
              },
            );
          },
        );
      },
      child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Text(
            'Change Target',
            style: TextStyle(fontSize: 24.sp),
          )),
    );
  }
}
