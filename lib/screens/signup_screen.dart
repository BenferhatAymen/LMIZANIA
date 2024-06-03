import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/screens/bottom_nav_bar.dart';
import 'package:lmizania/utils/basic_imports.dart';
import 'package:lmizania/utils/show_snack_bar.dart';
import 'package:lmizania/widget/custom_elevated_btn.dart';
import 'package:lmizania/widget/custom_google_btn.dart';
import 'package:lmizania/widget/custom_password_txtfield.dart';
import 'package:lmizania/widget/custom_rich_text.dart';
import 'package:lmizania/widget/custom_seperator.dart';
import 'package:lmizania/widget/text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../cubits/register_cubit/register_cubit.dart';

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
  String? email, password, confirmPassword, fullName;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BottomNavBar()),
          );
          isLoading = false;
        } else if (state is RegisterFailure) {
          isLoading = false;
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(Dimensions.paddingSize),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign Up',
                          style: CustomStyle.lightHeading1TextStyle,
                        ),
                      ),
                      SizedBox(height: Dimensions.heightSizelarge),
                      CustomTextField(
                        prefixIcon: Icons.person,
                        controller: _fullNameController,
                        hintText: 'Full Name',
                        onChanged: (data) {
                          fullName = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty || data.length < 5) {
                            return "enter a name ";
                          }
                        },
                      ),
                      SizedBox(height: Dimensions.heightSizelarge),
                      CustomTextField(
                        prefixIcon: Icons.email,
                        controller: _emailController,
                        hintText: 'Email',
                        onChanged: (data) {
                          email = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(data)) {
                            return "enter a valid email";
                          }
                        },
                      ),
                      SizedBox(height: Dimensions.heightSizelarge),
                      PasswordTextField(
                        prefixIcon: Icons.lock_sharp,
                        hintText: 'Password',
                        controller: _passwordController,
                        onChanged: (data) {
                          password = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty || data.length < 8) {
                            return "enter a valid password ";
                          }
                        },
                      ),
                      SizedBox(height: Dimensions.heightSizelarge),
                      PasswordTextField(
                        prefixIcon: Icons.lock_sharp,
                        hintText: 'Confirm Password',
                        controller: _confirmPasswordController,
                        onChanged: (data) {
                          confirmPassword = data;
                        },
                        validator: (data) {
                          if (data!.isEmpty || data.length < 8) {
                            return "enter a valid password ";
                          } else if (data != password) {
                            return "password does not match";
                          }
                        },
                      ),
                      SizedBox(height: Dimensions.heightSizelarge),
                      CustomElevatedButton(
                        text: 'Sign Up',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if(_agreeToTerms){
                              BlocProvider.of<RegisterCubit>(context)
                                .RegisterUser(
                                    email: email!,
                                    password: password!,
                                    fullName: fullName!);
                            }else{
                                        showSnackBar(context, "Please agree to terms of use");

                            }
                          }
                        },
                        isValid: true,
                      ),
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
                                  style: TextStyle(
                                      color: CustomColors.btnColor,
                                      fontSize: 12.sp,
                                      decoration: TextDecoration.underline),
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
                                  style: TextStyle(
                                      color: CustomColors.btnColor,
                                      fontSize: 12.sp,
                                      decoration: TextDecoration.underline),
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
                      CustomGoogleButton(onPressed: () {}),
                      CustomRichText(
                        text: "Already have an account?",
                        style: CustomStyle.lightSubtextTextStyle,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        textbtn: 'Login',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
