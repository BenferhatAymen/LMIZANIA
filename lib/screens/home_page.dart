import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/cubits/get_all_transactions_cubit/get_all_transactions_cubit.dart';
import 'package:lmizania/screens/all_transactions.dart';
import 'package:lmizania/screens/bar_chart.dart';
import 'package:lmizania/screens/bar_screen.dart';
import 'package:lmizania/screens/new_transaction.dart';
import 'package:lmizania/update_states.dart';
import 'package:lmizania/utils/basic_imports.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../colors.dart';
import '../cubits/set_wallet_cubit/set_wallet_cubit.dart';
import '../model/transactions_model.dart';
import '../widget/total_balance.dart';
import '../widget/transaction_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lmizania/cubits/get_wallet/get_wallet_cubit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = 'Susan Changi';
  int balance = 5200000;
  int income = 5200000;
  int expense = 1850000;
  late Timer _timer;
  bool _isFirstGradient = true;

  @override
  void initState() {
    super.initState();
    updateHomeScreen(context);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        _isFirstGradient = !_isFirstGradient;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Transaction> latestTransactions = transactions.where((transaction) {
      DateTime now = DateTime.now();
      return transaction.date.year == now.year &&
          transaction.date.month == now.month &&
          (transaction.date.day == now.day ||
              transaction.date.day == now.day - 1 ||
              (transaction.date.isAfter(now.subtract(Duration(days: 7))) &&
                  transaction.date.isBefore(now)));
    }).toList();

    return Scaffold(
      backgroundColor: CustomColors.bg,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: buildAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
              mainAxisSize: mainMin,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TotalBalanceContainer(
                  balance: balance,
                  income: income,
                  expense: expense,
                  isFirstGradient: _isFirstGradient,
                ),
                SizedBox(height: Dimensions.heightSize),
                recentTransactions(),
                SizedBox(height: 10),
                Flexible(
                  fit: FlexFit.loose,
                  child: TransactionListView(
                    transactions: latestTransactions,
                    isLatestTransactions: true,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15, top: 15),
                  height: 90,
                  child: ElevatedButton(
                    onPressed: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen:
                            AllTransactions(transactions: latestTransactions),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                      foregroundColor: CustomColors.navorappbar, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corners
                        side: BorderSide(
                            color: CustomColors.navorappbar), // Border color
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "All Transactions",
                          style: TextStyle(
                            color: TColor.themeColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_outward,
                          color: TColor.themeColor,
                          size: 26,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: AddTransactionPage(),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        // onPressed: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTransactionPage()));
        // },
        backgroundColor: CustomColors.navorappbar, // Change background color
        shape: CircleBorder(), // Make it circular
        child: Center(
            child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 50,
        )),
      ),
    );
  }

  Container recentTransactions() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Text(
        'Recent Transations',
        style: TextStyle(
          color: TColor.themeColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildAppBar() {
    var media = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      child: AppBar(
        backgroundColor:
            CustomColors.navorappbar, // Maintain the same background color
        elevation: 2, // Remove elevation
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.r),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 6.h, left: 10.w, right: 10.w),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 12.w,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    height: 55.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                              'https://xsgames.co/randomusers/avatar.php?g=female'),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          constraints:
                              BoxConstraints(minWidth: 80, maxWidth: 200),
                          child: Text(
                            userName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: TColor.themeColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: Dimensions.iconSizeLarge,
                  ),
                  onPressed: () {
                    // updateHomeScreen(context);
                    // Handle notifications here
                    
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String subtitle;
  final String transactionAmount;

  CustomRow({
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.transactionAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: CustomColors.navorappbar.withOpacity(0.5),
          child: Icon(
            leadingIcon,
            color: CustomColors.navorappbar,
          ),
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14.0),
            ),
          ],
        ),
        const Spacer(),
        Text(
          transactionAmount,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
