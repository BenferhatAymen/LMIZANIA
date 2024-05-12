import 'package:lmizania/screens/home_page.dart';
import 'package:lmizania/screens/login_screen.dart';
import 'package:lmizania/screens/statistic_screen.dart';
import 'package:lmizania/screens/wallet_screen.dart';
import 'package:lmizania/settings_view/settings_view.dart';
import 'package:lmizania/utils/basic_imports.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBar extends StatelessWidget {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      WalletScreen(),
      StatisticsPage(),
      SettingsView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        activeColorPrimary: CustomColors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.wallet),
        title: ("Wallet"),
        textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
        activeColorPrimary: CustomColors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.stacked_bar_chart),
        title: ("Statistics"),
        textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
        activeColorPrimary: CustomColors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("Setting"),
        textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
        activeColorPrimary: CustomColors.white,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: false,
      backgroundColor: CustomColors.navorappbar,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        colorBehindNavBar: Colors.black,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
