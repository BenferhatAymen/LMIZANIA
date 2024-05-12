
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/utils/basic_imports.dart';
import 'package:lmizania/widget/basic_login_widget_imports.dart';

import 'otp_screen.dart';
class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30.h,),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: CustomColors.btnColor), // Set your border color here
                ),
                child: CircleAvatar(
                  backgroundColor: CustomColors.btnColor.withOpacity(0.15),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: CustomColors.btnColor,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },

                  ),
                ),
              ),
          
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height:80,),
                  Text(
                    'Forgot Password',
                    style: CustomStyle.lightHeading1TextStyle
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Please enter the email address associated with your account.',
                    textAlign: TextAlign.center,

                    style: CustomStyle.lightSubtextTextStyle,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    prefixIcon: Icons.email,
                    controller: _emailController,
                    hintText: 'Email',
                  ),
                  SizedBox(height: 20),
                  CustomElevatedButton(
                    text: 'Submit',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EnterOTPScreen()));
                    }, isValid: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
