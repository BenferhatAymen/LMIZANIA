import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../utils/basic_imports.dart';

class SavingContainer extends StatelessWidget {
  const SavingContainer({
    Key,
    key,
    required this.savings,
    required this.isFirstGradient,
  }) : super(key: key);

  final int savings;
  final bool isFirstGradient;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      decoration: _animation(isFirstGradient),
      child: Padding(
        padding: EdgeInsets.all(14.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Column(

                    mainAxisAlignment: mainStart,
                    crossAxisAlignment: crossStart,
                    children: [
                      Text(
                        'Savings:',
                        style: GoogleFonts.openSans(
                          fontSize: Dimensions.headingTextSize5,
                          color: Colors.white.withOpacity(0.75),
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(NumberFormat('#,###').format(savings) + ' DA',
                          style: GoogleFonts.openSans(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ]),
                Column(
                  mainAxisAlignment: mainEnd,
                  children: [
                    Image.asset(
                      'assets/transactions/saving.png',
                      height: 44.h,
                      width: 44.w,
                    ),
                  ],
                )
              ],
            ),
            Text(
              'Started: 25-05-2023',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 14.sp,
              ),
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
