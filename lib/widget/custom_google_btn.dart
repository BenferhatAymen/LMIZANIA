import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/utils/basic_imports.dart';

class CustomGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomGoogleButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 46.h,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: CustomColors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: CustomColors.strong),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: Image.asset(
          'assets/Login/google.png',
          height: 26.h,
          width: 26.w,
        ),
        label: const Text(
          'Sign Up with Google',
          style: TextStyle(color: CustomColors.btnColor),
        ),
      ),
    );
  }
}
