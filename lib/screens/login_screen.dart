import 'package:lmizania/screens/singup_screen.dart';
import 'package:lmizania/utils/basic_imports.dart';
import 'package:lmizania/widget/basic_login_widget_imports.dart';
import 'bottom_nav_bar.dart';
import 'forgotpassword_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(Dimensions.paddingSize),
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
              style:   CustomStyle.lightSubtextTextStyle,

            ),
            SizedBox(height:  Dimensions.topHeight),
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
            ),
             SizedBox(height: Dimensions.heightSize),
            PasswordTextField(
              prefixIcon: Icons.lock_sharp,
              hintText: 'Password',
              controller: _passwordController,
            ),

            SizedBox(height: Dimensions.heightSize),
            forgotPassword(context),
            CustomElevatedButton(
              text: 'Login',
              onPressed: () {
                // Add your logic for the button onPressed callback here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavBar()),
                );
              }, isValid: true,
            ),
            SizedBox(height: Dimensions.topHeight),
            ///or separator
            CustomSeparator(),
            ///google icon button
            CustomGoogleButton(onPressed: () {  },),
            const Expanded(
              child: SizedBox(height: 0),
            ),
            CustomRichText(
              text: "Don't have an account?",
              style: CustomStyle.lightSubtextTextStyle,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUpScreen()));
              }, textbtn: ' Sign Up',
            ),
          ],
        ),
      ),
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


