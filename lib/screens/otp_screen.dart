import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:lmizania/screens/update_password.dart';
import 'package:lmizania/utils/custom_style.dart';
import 'package:lmizania/widget/basic_login_widget_imports.dart';
import '../utils/custom_colors.dart';

class EnterOTPScreen extends StatefulWidget {
  const EnterOTPScreen();

  @override
  _EnterOTPScreenState createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose(); // Dispose of the TextEditingController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: CustomColors.btnColor), // Set your border color here
              ),
              child: CircleAvatar(
                backgroundColor: CustomColors.btnColor.withOpacity(0.15),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: CustomColors.btnColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            SizedBox(height: 80),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter OTP',
                  style: CustomStyle.lightHeading1TextStyle,
                ),
                SizedBox(height: 20),
                Text(
                  'We have sent a verification code to your email address.',
                  textAlign: TextAlign.center,
                  style: CustomStyle.lightSubtextTextStyle,
                ),
                SizedBox(height: 20),
                PinCodeFields(
                  length: 4,
                  controller: _otpController,
                  fieldBorderStyle: FieldBorderStyle.square,
                  responsive: false,
                  fieldHeight: 56.0,
                  fieldWidth: 60.0,
                  borderWidth: 2.0,
                  activeBorderColor: CustomColors.btnColor,
                  activeBackgroundColor: CustomColors.btnColor,
                  borderRadius: BorderRadius.circular(12),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autoHideKeyboard: true,
                  borderColor: CustomColors.subtextGrey,
                  fieldBackgroundColor: CustomColors.subtextGrey,
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    color: CustomColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  onComplete: (String value) {
                    print("Completed: $value");
                  },
                ),
                SizedBox(height: 20),
                CustomElevatedButton(
                  text: 'Verify',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdatePasswordScreen()));
                  },
                  isValid: true,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
