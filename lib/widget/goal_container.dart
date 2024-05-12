import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../utils/basic_imports.dart';

class GoalsContainer extends StatelessWidget {
  const GoalsContainer({
    Key ,key,
    required this.goals,
    required this.isFirstGradient,
  }) : super(key: key);

  final int goals;
  final bool isFirstGradient;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      decoration: _animation(isFirstGradient),
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
                          NumberFormat('#,##,###').format(goals) + ' DA',
                          style: CustomStyle.balanceAmount,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: mainStart,
                      crossAxisAlignment: crossStart,
                      children: [
                        Text(
                          'Main Goal:',
                          style: CustomStyle.balanceTxtStyle,
                        ),
                        Text(
                          'Laptop',
                          style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
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
                '70%',
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
                    value: 0.8,
                    minHeight: 28,
                    backgroundColor: Colors.grey,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                ),
                Positioned(
                  child: Center(
                    child: Text(
                      "${NumberFormat('#,###').format(4800)} DA",
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
