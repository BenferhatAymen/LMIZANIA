import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../colors.dart';
import '../model/transactions_model.dart';
import '../utils/basic_imports.dart';

class TransactionListView extends StatefulWidget {
  final List<Transaction> transactions;

  TransactionListView({required this.transactions});

  @override
  State<TransactionListView> createState() => _TransactionListViewState();
}

class _TransactionListViewState extends State<TransactionListView> {
  DateTime _selectedDate = DateTime.now();

@override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final groupedTransactions = groupTransactionsByDate(widget.transactions);
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: groupedTransactions.length,
      itemBuilder: (context, index) {
        final date = groupedTransactions.keys.elementAt(index);
        final dateTransactions = groupedTransactions[date]!;
        // Parse the date string to a DateTime object if necessary
        DateTime parsedDate;
        parsedDate = DateTime.parse(date);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            // Date header
            ListTile(
              title: label(parsedDate),
            ),
            // List of transactions for this date
            ...dateTransactions.map((transaction) {
               return GestureDetector(
                 onTap: () {
                   showModalBottomSheet(
                     context: context,
                     builder: (BuildContext context) {
                       return buildTransactionBottomSheet(transaction);
                     },
                   );
                 },
                 child: Container(
                   margin: EdgeInsets.only(bottom: 10),
                   padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey.withOpacity(0.5),
                         spreadRadius: 1,
                         blurRadius: 5,
                         offset: Offset(0, 3),
                       ),
                     ],
                     borderRadius: BorderRadius.circular(12),
                   ),
                   child: Row(
                     children: [
                       Container(
                         alignment: Alignment.center,
                         height: 36,
                         width: 36,
                         decoration: BoxDecoration(
                           color: TColor.themeColor.withOpacity(0.2),
                           borderRadius: BorderRadius.circular(200),
                         ),
                         child: Icon(transaction.icon, color: TColor.themeColor, size: 26),
                       ),
                       SizedBox(width: 14),
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               transaction.category,
                               style: TextStyle(
                                 color: TColor.themeColor,
                                 fontSize: 17,
                                 fontWeight: FontWeight.w600,
                               ),
                               softWrap: true,
                               overflow: TextOverflow.ellipsis,
                               maxLines: 1,
                             ),
                             SizedBox(height: 5),
                             Text(
                               transaction.item,
                               style: TextStyle(
                                 color: TColor.themeColor,
                                 fontSize: 15,
                                 fontWeight: FontWeight.w400,
                               ),
                               overflow: TextOverflow.ellipsis,
                               maxLines: 1,
                             ),
                           ],
                         ),
                       ),
                       SizedBox(width: 10),
                       Text(
                         "${transaction.amount} DA",
                         style: TextStyle(
                           color: Colors.red,
                           fontSize: 18,
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                     ],
                   ),
                 ),
               );
            }).toList(),
          ],
        );
      },
    );
  }

  Widget label(DateTime date) {
    DateTime now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return Text(
        'Today',
        style: CustomStyle.strongTextStyle,
      );
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1) {
      return Text(
        'Yesterday',
        style: CustomStyle.strongTextStyle,
      );
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 5) {
      return Text(
        'Last Week',
        style: CustomStyle.strongTextStyle,
      );
    } else {
      String formattedDate = DateFormat('d MMMM').format(date);
      return Text(
        formattedDate,
        style: CustomStyle.strongTextStyle,
      );
    }
  }

  Widget buildTransactionBottomSheet(Transaction transaction) {
    TextEditingController _itemNameController = TextEditingController(text: transaction.item);
    TextEditingController _amountController = TextEditingController(text: NumberFormat('#,###').format(transaction.amount) + ' DA');
    TextEditingController _dateController = TextEditingController(text: DateFormat('dd/MM/yyyy').format(transaction.date));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            height: 5.h,
              width: 50.w,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: CustomColors.strong,

            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                'Transaction',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              Padding(
                padding: EdgeInsets.all(5.r),
                child: Container(
                  height: 50.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                      color: CustomColors.navorappbar.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(15))),
                  child: Icon(transaction.icon, color: CustomColors.navorappbar, size: Dimensions.iconSizeLarge),
                ),
              ),
            ],
          ),
        ),
        buildTextField('Item Name', transaction.icon, _itemNameController),
         SizedBox(height: Dimensions.heightSize),
        buildTextField('Amount', Icons.money, _amountController),
        SizedBox(height: Dimensions.heightSize),
        buildDateElevatedButton(
          Icons.calendar_today,
          '12 September 2024',
              () {
            _showDatePickerBottomSheet(context);
          },
        ),        Padding(
          padding: EdgeInsets.all(15.r),
          child: Row(
            children: [
              Expanded(
                child: Container(                  height: 60,

                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.btnColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        )
                      ),
                      onPressed: (){}, child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit_outlined, color: Colors.white,),
                      SizedBox(width: 5,),
                      Text('Edit', style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white,
                      ),),
                    ],
                  )),
                ),
              ),
              SizedBox(width: Dimensions.widthSize,),
              Expanded(
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            side: BorderSide(color: Colors.grey)
                          )
                      ),
                      onPressed: (){}, child: Row(
                    mainAxisAlignment: mainCenter,
                    children:  [
                      Icon(Icons.delete_outline_outlined, color: Colors.red,),
                      SizedBox(width: 5,),
                      Text('Delete',style: TextStyle(
                        color: Colors.red,
                        fontSize: 25.sp,
                     ) ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _showDatePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 320.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Date', style: TextStyle(fontSize:Dimensions.headingTextSize3)),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.paddingSizeHorizontalSize, right: Dimensions.paddingSizeVerticalSize),
                child: DatePickerWidget(

                  looping: true,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030, 1, 1),
                  initialDate: DateTime(2020, 1,1),// DateTime(1994),
                  dateFormat: "MMMM/dd/yyyy",
                  locale: DatePicker.localeFromString('en'),
                  onChange: (DateTime newDate, _) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                    print(_selectedDate);
                  },
                  pickerTheme: DateTimePickerTheme(
                    backgroundColor: Colors.transparent,
                    itemTextStyle: TextStyle(color: Colors.black, fontSize: 24),
                    itemHeight: 25.h,

                    dividerColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: saveButton()),
            ],
          ),
        );
      },
    );
  }
  ElevatedButton saveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.btnColor,
          foregroundColor: CustomColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )
      ),
      onPressed: () {
        // Handle save button press
      },
      child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Text('Save', style: TextStyle(fontSize: 24.sp),)),
    );
  }
  Widget buildTextField(String text, IconData icon, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.paddingSize, right: Dimensions.paddingSize),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding:  EdgeInsets.all(10.r),
            child: Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                  color: CustomColors.strong.withOpacity(0.2),
                  borderRadius:  BorderRadius.all(Radius.circular(15.r))),
              child: Icon(icon, color: CustomColors.strong, size: 32),
            ),
          ),
          prefixIconConstraints:  BoxConstraints(minWidth: 40.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: TColor.themeColor.withOpacity(0.8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: TColor.themeColor.withOpacity(0.8)), // Same color as regular border
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: TColor.themeColor.withOpacity(0.8)), // Same color as regular border
          ),
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color:TColor.themeColor.withOpacity(0.8)), // Same color as regular border
          ) ,
          filled: true,
          fillColor: Colors.white,
          hintText: text,
          hintStyle: GoogleFonts.openSans(color: Colors.black, fontSize: 19,fontWeight:FontWeight.bold),
        ),
        style:  GoogleFonts.openSans(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w500),
      ),
    );
  }
Widget buildDateElevatedButton(
      IconData icon, String text, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 65,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: CustomColors.navorappbar,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: CustomColors.navorappbar)
          ),
        ),
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Row(
             children: [
               Icon(icon),
               const SizedBox(width: 10),
               Text(
                 text,
                 style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400),
               ),
             ],
           ),
           Icon(Icons.arrow_forward_ios, color: CustomColors.navorappbar,),
         ],
                  ),
      ),
    );
  }}
