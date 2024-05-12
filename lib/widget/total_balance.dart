import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../utils/basic_imports.dart';
import '../widget/custom_transactions.dart';

class TotalBalanceContainer extends StatelessWidget {
  const TotalBalanceContainer({
    Key, key,
    required this.balance,
    required this.income,
    required this.expense,
    required this.isFirstGradient,
  }) : super(key: key);

  final int balance;
  final int income;
  final int expense;
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
                      'Total Balance:',
                      style: CustomStyle.balanceTxtStyle,
                    ),
                     Row(
                      children: [
                        Text(
                          NumberFormat('#,###').format(balance) + ' DA',
                          style: CustomStyle.balanceAmount,
                        ),
                      ],
                    )
                  ],
                ),
                Image.asset(
                  'assets/transactions/wallet.png',
                  height: 60,
                  width: 60,
                ),
              ],
            ),
            SizedBox(height: Dimensions.heightSize),
            Row(
              children: [
                CustomTransactionContainer(
                  label: 'Income',
                  amount: income,
                  icon: Icons.arrow_upward,
                  iconColor: CustomColors.green,
                  containerColor: const Color(0xFF00A86B),
                  rotationAngle: 360 / 180,
                ),
                const Spacer(),
                CustomTransactionContainer(
                  label: 'Expense',
                  amount: expense,
                  icon: Icons.arrow_upward,
                  iconColor: CustomColors.red,
                  containerColor: const Color(0xFF00A86B),
                  rotationAngle: 45,
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
