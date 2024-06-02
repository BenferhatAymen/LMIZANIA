import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lmizania/cubits/login_cubit/login_cubit.dart';
import 'package:lmizania/screens/signup_screen.dart';
import 'package:lmizania/utils/basic_imports.dart';
import 'package:lmizania/utils/show_snack_bar.dart';
import 'package:lmizania/widget/basic_login_widget_imports.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'bottom_nav_bar.dart';
import 'forgotpassword_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? email, password;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BottomNavBar()),
          );
          isLoading = false;
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              // Use SingleChildScrollView to handle keyboard overlap
              child: Container(
                padding: EdgeInsets.all(Dimensions.paddingSize),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: Dimensions.topHeight),
                      Text(
                        'Welcome Back',
                        style: CustomStyle.lightHeading1TextStyle,
                      ),
                      Text(
                        'Login to your account',
                        textAlign: TextAlign.center,
                        style: CustomStyle.lightSubtextTextStyle,
                      ),
                      SizedBox(height: Dimensions.topHeight),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Login',
                          style: CustomStyle.lightHeading1TextStyle,
                        ),
                      ),
                      SizedBox(height: Dimensions.heightSize),
                      CustomTextField(
                        prefixIcon: Icons.email,
                        hintText: 'Username/Email',
                        controller: _usernameController,
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
                      SizedBox(height: Dimensions.heightSize),
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
                      SizedBox(height: Dimensions.heightSize),
                      forgotPassword(context),
                      CustomElevatedButton(
                        text: 'Login',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // Handle login logic here
                            BlocProvider.of<LoginCubit>(context)
                                .LoginUser(email: email!, password: password!);
                           }
                        },
                        isValid: true,
                      ),
                      SizedBox(height: Dimensions.topHeight),
                      CustomSeparator(),
                      CustomGoogleButton(
                        onPressed: () {},
                      ),
                      CustomRichText(
                        text: "Don't have an account?",
                        style: CustomStyle.lightSubtextTextStyle,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SignUpScreen()),
                          );
                        },
                        textbtn: ' Sign Up',
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

  Align forgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
          );
        },
        style: TextButton.styleFrom(
          foregroundColor: CustomColors.error,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Forgot Password?',
          style: CustomStyle.forgetPassword,
        ),
      ),
    );
  }
}
