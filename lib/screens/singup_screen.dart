import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/utils/basic_imports.dart';
import 'package:lmizania/widget/basic_login_widget_imports.dart';

import 'login_screen.dart';
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(Dimensions.paddingSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80.h,),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Sign Up',
                style: CustomStyle.lightHeading1TextStyle,),
            ),
            SizedBox(height: Dimensions.heightSizelarge),
            CustomTextField(
              prefixIcon: Icons.person,
              controller: _fullNameController,
              hintText: 'Full Name',
            ),
            SizedBox(height: Dimensions.heightSizelarge),
            CustomTextField(
              prefixIcon: Icons.email,
              controller: _emailController,
              hintText: 'Emali',
            ),
            SizedBox(height: Dimensions.heightSizelarge),
            PasswordTextField(
              prefixIcon: Icons.lock_sharp,
              hintText: 'Password',
              controller: _passwordController,
            ),
            SizedBox(height: Dimensions.heightSizelarge),
            PasswordTextField(
              prefixIcon: Icons.lock_sharp,
              hintText: 'Confirm Password',
              controller: _confirmPasswordController,
            ),
            SizedBox(height: Dimensions.heightSizelarge),
          CustomElevatedButton(text: 'Sign Up', onPressed: (){}, isValid: true,),

          Row(
            children: [
              Checkbox(
                value: _agreeToTerms,
                onChanged: (value) {
                  setState(() {
                    _agreeToTerms = value!;
                  });
                },
                activeColor: CustomColors.btnColor,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'I agree to the ',
                      style: CustomStyle.agrementTextStyle,
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: CustomColors.btnColor, fontSize: 12.sp, decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle Privacy Policy click
                        },
                    ),
                    TextSpan(
                      text: ' and ',
                      style: CustomStyle.agrementTextStyle,
                    ),
                    TextSpan(
                      text: 'Terms of Conditions',
                      style: TextStyle(color: CustomColors.btnColor, fontSize:12.sp, decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle Terms of Conditions click
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
            SizedBox(height: 80.h),
            CustomSeparator(),
            CustomGoogleButton(onPressed: (){}),
            Expanded(child: SizedBox(height: 0,)),
            CustomRichText(
              text: "Already have an account?",
              style: CustomStyle.lightSubtextTextStyle,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()));
              }, textbtn: ' Login',
            ),          ],
        ),
      ),
    );
  }
}