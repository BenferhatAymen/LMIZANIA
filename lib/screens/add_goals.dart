import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/utils/basic_imports.dart';

import '../widget/custom_appbar.dart';

class AddGoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bg,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: CustomAppBar(
          onBack: () {
            // Handle back button press
          },
          text: 'Add Goals',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.green),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: mainCenter,
                children: [
                  Icon(
                    Icons.attach_file,
                    size: 100.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(height: Dimensions.heightSize),
                  Text(
                    'Add a photo of your goal',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.heightSize),
            title('Goal Name'),
            _buildTextField(
                label: 'Goal Name', hintText: 'Write your goal name'),
            SizedBox(height: Dimensions.heightSize),
            title('Goal Price'),
            _buildTextField(label: 'Goal Price', hintText: 'Enter goal price'),
            SizedBox(height: Dimensions.heightSize),
            title('Description'),
            _buildTextField(
                label: 'Description', hintText: 'Enter description'),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.btnColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        )),
                    onPressed: () {
                      // Handle save
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.headingTextSize3),
                    ),
                  ),
                ),
                SizedBox(width: Dimensions.widthSize),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      side: BorderSide(color: Colors.grey),
                    ),
                    onPressed: () {
                      // Handle cancel
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget title(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 8, top: 8),
      child: Text(
        text,
        style: GoogleFonts.openSans(
          fontSize: Dimensions.headingTextSize4,
          color: CustomColors.top,
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String hintText}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
