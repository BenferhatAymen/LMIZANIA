import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lmizania/cubits/get_all_goals_cubit/get_all_goals_cubit.dart';
import 'package:lmizania/data/models/goal_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../utils/basic_imports.dart';

class GoalsContainer extends StatefulWidget {
  const GoalsContainer({
    Key,
    key,
    required this.goals,
    required this.isFirstGradient,
  }) : super(key: key);

  final int goals;
  final bool isFirstGradient;

  @override
  State<GoalsContainer> createState() => _GoalsContainerState();
}

class _GoalsContainerState extends State<GoalsContainer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetAllGoalsCubit>(context).getAllGoals();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllGoalsCubit, GetAllGoalsState>(
      builder: (context, state) {
        if (state is GetAllGoalsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetAllGoalsSuccess) {
          GoalModel? mostProgressedGoal;
          var sortedGoals = state.goals
            ..sort((a, b) => (b.currentAmount! / b.targetAmount!)
                .compareTo((a.currentAmount! / a.targetAmount!)));
          if (!sortedGoals.isEmpty) {
            mostProgressedGoal = sortedGoals.first;
          }
          return AnimatedContainer(
            duration: const Duration(seconds: 1),
            decoration: _animation(widget.isFirstGradient),
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: mainSpaceBet,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Goals:',
                            style: CustomStyle.balanceTxtStyle,
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Text(
                                mostProgressedGoal == null
                                    ? "0 DA"
                                    : NumberFormat('#,###').format(
                                            mostProgressedGoal.targetAmount) +
                                        ' DA',
                                style: CustomStyle.balanceAmount,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: mainStart,
                            crossAxisAlignment: crossStart,
                            children: [
                              Text(
                                'Most Progressed Goal:',
                                style: CustomStyle.balanceTxtStyle,
                              ),
                              Text(
                                mostProgressedGoal == null
                                    ? "No goal"
                                    : mostProgressedGoal.name!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      Image.asset(
                        'assets/transactions/goal.png',
                        height: 60.h,
                        width: 49.w,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      mostProgressedGoal == null
                          ? "0%"
                          : ((mostProgressedGoal!.currentAmount! /
                                              mostProgressedGoal!
                                                  .targetAmount!) *
                                          100)
                                      .toInt()
                                      .toString() +
                                  "%" ??
                              "0%",
                      style: TextStyle(
                        color: CustomColors.yellowColor,
                        fontSize: Dimensions.headingTextSize5,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: LinearProgressIndicator(
                          value: mostProgressedGoal == null
                              ? 0
                              : (mostProgressedGoal.currentAmount! /
                                  mostProgressedGoal.targetAmount!),
                          minHeight: 28,
                          backgroundColor: Colors.grey,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.orange),
                        ),
                      ),
                      Positioned(
                        child: Center(
                          child: Text(
                            mostProgressedGoal == null
                                ? "0 DA"
                                : "${NumberFormat('#,###').format(mostProgressedGoal.currentAmount)} DA" ??
                                    "0 DA",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Text('error');
        }
      },
    );
  }

  BoxDecoration _animation(bool isFirstGradient) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      gradient: isFirstGradient
          ? LinearGradient(
              colors: [
                const Color(0xFF00494C).withOpacity(0.8),
                const Color(0xFF00686C).withOpacity(0.7),
                const Color(0xFF00787D),
                const Color(0xFF008C92).withOpacity(0.7),
                const Color(0xFF00494C).withOpacity(0.8),
              ],
              stops: [0.0, 0.2, 0.5, 0.7, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          : LinearGradient(
              colors: [
                const Color(0xFF00494C).withOpacity(0.8),
                const Color(0xFF00686C).withOpacity(0.7),
                const Color(0xFF00787D),
                const Color(0xFF008C92).withOpacity(0.53),
                const Color(0xFF00494C).withOpacity(0.8),
              ],
              stops: [0.0, 0.53, 0.7, 0.8, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
    );
  }
}
