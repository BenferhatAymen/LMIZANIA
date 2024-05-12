import 'package:flutter/material.dart';
import 'package:lmizania/utils/basic_imports.dart';
import 'package:lmizania/widget/basic_login_widget_imports.dart';

class UpdatePasswordScreen extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Update Password',
              style: CustomStyle.lightHeading1TextStyle,
            ),
            SizedBox(height: 10),
            Text(
              'You have passed the verification, now you can change your password.',
              style: CustomStyle.lightSubtextTextStyle,
              textAlign: TextAlign.center,

            ),
            SizedBox(height: 80),
            PasswordTextField(
              hintText: 'Password',
              controller: _passwordController,
              prefixIcon: Icons.lock,
            ),
            SizedBox(height: 20),
            PasswordTextField(
              hintText: 'Confirm Password',
              controller: _confirmPasswordController,
              prefixIcon: Icons.lock,
            ),
            SizedBox(height: 20),
            CustomElevatedButton(
              text: 'Update',
              onPressed: () {
                // Add logic to handle submit button press
                _showBottomSheet(context);
              }, isValid: true,
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: CustomColors.btnColor, width: 3), // Set your border color here
                ),
                child: CircleAvatar(
                  backgroundColor: CustomColors.white,
                  child: Icon(
                    Icons.check,
                    color: CustomColors.btnColor,
                    size: 56,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Updated!',
                style: CustomStyle.lightHeading2TextStyle,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,

                  'Your password has been updated successfuly.',
                  style: CustomStyle.bodyTextStyle,
                ),
              ),
              SizedBox(height: 20),
        CustomElevatedButton(
                text: 'Save',
                onPressed: () {
                  // Add logic to handle save button press
                  Navigator.pop(context);
                }, isValid: true,
              ),
            ],
          ),
        );
      },
    );
  }
}
