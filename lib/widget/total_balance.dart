import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lmizania/cubits/get_all_expense_cubit/get_all_expense_cubit.dart';
import 'package:lmizania/cubits/get_all_income_cubit/get_all_income_cubit.dart';
import 'package:lmizania/cubits/get_wallet/get_wallet_cubit.dart';
import '../cubits/set_wallet_cubit/set_wallet_cubit.dart';
import '../utils/basic_imports.dart';
import '../utils/desposit_alert_dialog.dart';
import '../widget/custom_transactions.dart';

class TotalBalanceContainer extends StatefulWidget {
  TotalBalanceContainer({
    Key,
    key,
    required this.balance,
    required this.income,
    required this.expense,
    required this.isFirstGradient,
  }) : super(key: key);

  final int balance;
  final int income;
  final int expense;
  final bool isFirstGradient;
  late int settedAmount = 30000;
  @override
  State<TotalBalanceContainer> createState() => _TotalBalanceContainerState();
}

class _TotalBalanceContainerState extends State<TotalBalanceContainer> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetWalletCubit>(context).getWallet();
    BlocProvider.of<GetAllIncomeCubit>(context).GetAllIncome();
    BlocProvider.of<GetAllExpenseCubit>(context).GetAllExpense();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWalletCubit, GetWalletState>(
      builder: (context, state) {
        if (state is GetWalletLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetWalletSuccess) {
          return _buildBalanceContainer(state.balance);
        } else if (state is GetWalletFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildBalanceContainer(int balance) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (context) {
              return Form(
                key: formKey,
                child: DepositAlertDialog(
                  title: "Set Wallet",
                  validator: (data) {
                    if (data!.isEmpty) {
                      return "Please enter a valid amount";
                    }
                    return null;
                  },
                  onChanged: (data) {
                    widget.settedAmount = int.parse(data);
                  },
                  onSave: () async {
                    BlocProvider.of<SetWalletCubit>(context)
                        .setWallet(ammount: widget.settedAmount);
                    await Future.delayed(Duration(milliseconds: 100));

                    BlocProvider.of<GetWalletCubit>(context).getWallet();
                  },
                ),
              );
            });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        decoration: _animation(widget.isFirstGradient),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Balance:',
                        style: CustomStyle.balanceTxtStyle,
                      ),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          children: [
                            Text(
                              NumberFormat('#,###').format(balance) + ' DA',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: balance.toString().length > 11
                                    ? Dimensions.headingTextSize2 *
                                        (11 / balance.toString().length)
                                    : Dimensions.headingTextSize2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                  BlocBuilder<GetAllIncomeCubit, GetAllIncomeState>(
                    builder: (context, state) {
                      if (state is GetAllIncomeLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is GetAllIncomeSuccess) {
                        return CustomTransactionContainer(
                          label: 'Income',
                          amount: state.income,
                          icon: Icons.arrow_upward,
                          iconColor: CustomColors.green,
                          containerColor: const Color(0xFF00A86B),
                          rotationAngle: 360 / 180,
                        );
                      } else if (state is GetAllIncomeFailure) {
                        return Center(child: Text(state.errorMessage));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  const Spacer(),
                  BlocBuilder<GetAllExpenseCubit, GetAllExpenseState>(
                    builder: (context, state) {
                      if (state is GetAllExpenseLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is GetAllExpenseSuccess) {
                        return CustomTransactionContainer(
                          label: 'Expense',
                          amount: state.expense,
                          icon: Icons.arrow_upward,
                          iconColor: CustomColors.red,
                          containerColor: const Color(0xFF00A86B),
                          rotationAngle: 45,
                        );
                      } else if (state is GetAllExpenseFailure) {
                        return Center(child: Text(state.errorMessage));
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
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
