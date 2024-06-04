import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lmizania/cubits/add_goal/add_goal_cubit.dart';
import 'package:lmizania/cubits/get_all_expense_cubit/get_all_expense_cubit.dart';
import 'package:lmizania/cubits/get_all_goals_cubit/get_all_goals_cubit.dart';
import 'package:lmizania/cubits/get_all_income_cubit/get_all_income_cubit.dart';
import 'package:lmizania/cubits/get_all_transactions_cubit/get_all_transactions_cubit.dart';
import 'package:lmizania/cubits/get_wallet/get_wallet_cubit.dart';

import 'utils/basic_imports.dart';

void updateHomeScreen(BuildContext context) {
  BlocProvider.of<GetWalletCubit>(context).getWallet();
  BlocProvider.of<GetAllIncomeCubit>(context).GetAllIncome();
  BlocProvider.of<GetAllExpenseCubit>(context).GetAllExpense();
  BlocProvider.of<GetAllTransactionsCubit>(context).getAllTransactions();
}

void updateTotalBalanceComponent(BuildContext context) {
  BlocProvider.of<GetWalletCubit>(context).getWallet();
  BlocProvider.of<GetAllIncomeCubit>(context).GetAllIncome();
  BlocProvider.of<GetAllExpenseCubit>(context).GetAllExpense();
}

void updateGoalsScreen(BuildContext context) {
  BlocProvider.of<GetAllGoalsCubit>(context).getAllGoals();
  
}
