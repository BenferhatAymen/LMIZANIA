import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/group_wallet/group_wallet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/screens/Goals.dart';
import 'package:lmizania/screens/saving_screen.dart';
import 'package:lmizania/utils/basic_imports.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../widget/goal_container.dart';
import '../widget/saving_Container.dart';
import '../widget/total_balance.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool _isSelectedPersonal = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.bgColor,
      appBar: AppBar(
        backgroundColor: Color(0xff00494C).withOpacity(0.95),
        title: Text(
          'Wallet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isSelectedPersonal = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(0, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: _isSelectedPersonal
                          ? TColor.themeColor
                          : Colors.white,
                    ),
                    child: Text(
                      'Personal',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: _isSelectedPersonal
                            ? Colors.white
                            : TColor.themeColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isSelectedPersonal = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(0, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: !_isSelectedPersonal
                          ? TColor.themeColor
                          : Colors.white,
                    ),
                    child: Text(
                      'Group',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: !_isSelectedPersonal
                            ? Colors.white
                            : TColor.themeColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: _isSelectedPersonal
                ? PersonalWalletScreen()
                : GroupWalletView(),
          ),
        ],
      ),
    );
  }
}

class PersonalWalletScreen extends StatefulWidget {
  PersonalWalletScreen({super.key});

  @override
  _PersonalWalletScreenState createState() => _PersonalWalletScreenState();
}

class _PersonalWalletScreenState extends State<PersonalWalletScreen> {
  bool _isFirstGradient = true;
  int balance = 5200000;
  int goals = 4800;
  int savings = 750000;
  int income = 5200000;
  int expense = 1850000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bg,
      body: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.heightSize,
            ),
            //total balance container
            TotalBalanceContainer(
              balance: balance,
              income: income,
              expense: expense,
              isFirstGradient: _isFirstGradient,
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            //goal container
            GestureDetector(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: Goals(),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: GoalsContainer(
                goals: goals,
                isFirstGradient: _isFirstGradient,
              ),
            ),
            SizedBox(
              height: Dimensions.heightSize,
            ),
            //saving container
            GestureDetector(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: Savings(),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: SavingContainer(
                savings: savings,
                isFirstGradient: _isFirstGradient,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(
      String text, bool isSelected, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : CustomColors.navorappbar,
          backgroundColor: isSelected ? CustomColors.navorappbar : Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)))),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Row(
          children: [
            Text(
              text,
              style: GoogleFonts.openSans(
                fontSize: 20.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
