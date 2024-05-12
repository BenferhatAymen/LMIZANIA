import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/basic_imports.dart';

class TargetDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingSize),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Target',
                style: CustomStyle.strongTextStyle,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40.h,
              child: Card(
                elevation: 0,
                color: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            filled: true,
                            hintText: '50 000',
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 12.sp,
                            ),
                            fillColor: Colors.grey.shade100,
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const Text('DA', style: TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                      ),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.heightSizelarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.btnColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        )
                    ),
                    onPressed: () {
                      // Handle save
                    },
                    child: Text('Save', style: TextStyle(color: Colors.white, fontSize: Dimensions.headingTextSize3),),
                  ),
                ),
                SizedBox(width: Dimensions.widthSize),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      side: BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                    onPressed: () {
                      // Handle cancel
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel', style: TextStyle(color: Colors.red),),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
