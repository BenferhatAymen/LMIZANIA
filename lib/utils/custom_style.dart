import 'package:lmizania/utils/basic_imports.dart';

import '../colors.dart';


class CustomStyle {
  //------------------------light--------------------------------

  static var lightHeading1TextStyle = GoogleFonts.openSans(
    color: CustomColors.strong,
    fontSize: Dimensions.headingTextSize1,
    fontWeight: FontWeight.w700,
  );
  static var goalTextStyle = GoogleFonts.openSans(
    color: CustomColors.strong,
    fontSize: Dimensions.headingTextSize3,
    fontWeight: FontWeight.w700,
  );
  static var lightHeading2TextStyle = GoogleFonts.openSans(
    color: CustomColors.navorappbar,
    fontSize: Dimensions.headingTextSize1,
    fontWeight: FontWeight.w700,
  );
  static var strongTextStyle = GoogleFonts.openSans(
       color: TColor.themeColor,
      fontSize: 20,
      fontWeight: FontWeight.w600,
   );
  static var balanceTxtStyle = GoogleFonts.openSans(
    color: Colors.white.withOpacity(0.75),
    fontSize: Dimensions.headingTextSize4,
    fontWeight: FontWeight.w700,
  );
  static var balance2TxtStyle = GoogleFonts.openSans(
    color: Colors.white,
    fontSize:15,
    fontWeight: FontWeight.w500,
  );
  static var balanceAmount = GoogleFonts.openSans(
    color: Colors.white,
    fontSize: Dimensions.headingTextSize2,
    fontWeight: FontWeight.w400,
  );
  static var bodyTextStyle = GoogleFonts.openSans(
    color: Colors.black,
    fontSize: Dimensions.headingTextSize3,
    fontWeight: FontWeight.w400,
  );
  static var lightSubtextTextStyle = GoogleFonts.openSans(
    color: CustomColors.subtextGrey,
    fontSize: Dimensions.headingTextSize4,
    fontWeight: FontWeight.w400,
  );
  static var agrementTextStyle = GoogleFonts.openSans(
    color: CustomColors.subtextGrey,
    fontSize: Dimensions.headingTextSize5,
    fontWeight: FontWeight.w400,
  );
  static var lightButtonTextStyle = TextStyle(
    color: CustomColors.white,
    fontSize: Dimensions.headingTextSize4,
  );
  static var forgetPassword = GoogleFonts.openSans(
    color: CustomColors.forgotPass,
    decoration: TextDecoration.underline,
    fontSize: Dimensions.headingTextSize5,
  );
}
