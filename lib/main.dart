import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/cubits/add_expense_cubit/add_expense_cubit_cubit.dart';
import 'package:lmizania/cubits/add_goal/add_goal_cubit.dart';
import 'package:lmizania/cubits/add_income_cubit/add_income_cubit.dart';
import 'package:lmizania/cubits/delete_epense_cubit/delete_expense_cubit.dart';
import 'package:lmizania/cubits/delete_goal_cubit/delete_goal_cubit.dart';
import 'package:lmizania/cubits/deposit_goal_cubit/deposit_goal_cubit.dart';
import 'package:lmizania/cubits/get_all_expense_cubit/get_all_expense_cubit.dart';
import 'package:lmizania/cubits/get_all_goals_cubit/get_all_goals_cubit.dart';
import 'package:lmizania/cubits/get_all_income_cubit/get_all_income_cubit.dart';
import 'package:lmizania/cubits/get_all_transactions_cubit/get_all_transactions_cubit.dart';
import 'package:lmizania/cubits/get_wallet/get_wallet_cubit.dart';
import 'package:lmizania/cubits/register_cubit/register_cubit.dart';
import 'package:lmizania/cubits/login_cubit/login_cubit.dart';
import 'package:lmizania/cubits/set_wallet_cubit/set_wallet_cubit.dart';
import 'package:lmizania/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Locking Device Orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Lmizania());
}

class Lmizania extends StatelessWidget {
  const Lmizania({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => SetWalletCubit(),
        ),
        BlocProvider(
          create: (context) => GetWalletCubit(),
        ),
        BlocProvider(
          create: (context) => GetAllTransactionsCubit(),
        ),
        BlocProvider(
          create: (context) => GetAllIncomeCubit(),
        ),
        BlocProvider(
          create: (context) => GetAllExpenseCubit(),
        ),
        BlocProvider(
          create: (context) => AddIncomeCubit(),
        ),
        BlocProvider(
          create: (context) => AddExpenseCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteExpenseCubit(),
        ),
        BlocProvider(
          create: (context) => GetAllGoalsCubit(),
        ),
        BlocProvider(
          create: (context) => DepositGoalCubit(),
        ),
        BlocProvider(
          create: (context) => AddGoalCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteGoalCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: (context, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
