import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

import '../colors.dart';
import '../utils/basic_imports.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _itemNameController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: buildAppBar(),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              incomeVsexpenses(),
              SizedBox(height: Dimensions.heightSize),
              buildTextField('Item name', Icons.money),
              SizedBox(height: Dimensions.heightSize),
              buildTextField('Item price', Icons.price_change),
              SizedBox(height: Dimensions.heightSize),
              CategoriesContainer(isIncome: _isSelected[0]),
              SizedBox(height: Dimensions.heightSize),
              buildDateElevatedButton(
                Icons.calendar_today,
                'Today',
                () {
                  _showDatePickerBottomSheet(context);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(16.5),
            child: saveButton()),
      ),
    );
  }

  ElevatedButton saveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.btnColor,
          foregroundColor: CustomColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )),
      onPressed: () {
        // Handle save button press
      },
      child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Text(
            'Save',
            style: TextStyle(fontSize: 24.sp),
          )),
    );
  }

  Row incomeVsexpenses() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildElevatedButton(Icons.arrow_downward, 'Income', _isSelected[0], () {
          setState(() {
            _isSelected[0] = true;
            _isSelected[1] = false;
          });
        }),
        SizedBox(
          width: Dimensions.widthSize,
        ),
        buildElevatedButton(Icons.arrow_upward, 'Expense', _isSelected[1], () {
          setState(() {
            _isSelected[0] = false;
            _isSelected[1] = true;
          });
        }),
      ],
    );
  }

  TextField buildTextField(String text, IconData icon) {
    return TextField(
      controller: _itemNameController,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: CustomColors.strong.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Icon(icon,
                color: CustomColors.navorappbar,
                size: Dimensions.iconSizeDefault),
          ),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 40),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: TColor.themeColor.withOpacity(0.8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
              color: TColor.themeColor
                  .withOpacity(0.8)), // Same color as regular border
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
              color: TColor.themeColor
                  .withOpacity(0.8)), // Same color as regular border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
              color: TColor.themeColor
                  .withOpacity(0.8)), // Same color as regular border
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: text,
        hintStyle: GoogleFonts.openSans(color: Colors.grey, fontSize: 15),
      ),
    );
  }

  Widget buildElevatedButton(
      IconData icon, String text, bool isSelected, VoidCallback onPressed) {
    return Expanded(
      child: Container(
        height: 60,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              foregroundColor:
                  isSelected ? Colors.white : CustomColors.navorappbar,
              backgroundColor:
                  isSelected ? CustomColors.navorappbar : Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
          child: Padding(
            padding: EdgeInsets.all(5.r),
            child: Row(
              children: [
                Icon(icon),
                SizedBox(width: Dimensions.widthSize),
                Text(
                  text,
                  style: GoogleFonts.openSans(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDateElevatedButton(
      IconData icon, String text, VoidCallback onPressed) {
    return Container(
      height: 65,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: CustomColors.navorappbar,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: CustomColors.navorappbar)),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: CustomColors.navorappbar,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: AppBar(
          backgroundColor: CustomColors.navorappbar,
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(top: 20),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'New Transactions',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
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
              Text('Date',
                  style: TextStyle(fontSize: Dimensions.headingTextSize3)),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.paddingSizeHorizontalSize,
                    right: Dimensions.paddingSizeVerticalSize),
                child: DatePickerWidget(
                  looping: true,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030, 1, 1),
                  initialDate: DateTime(2020, 1, 1), // DateTime(1994),
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
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: saveButton()),
            ],
          ),
        );
      },
    );
  }
}

///catogoriesContainer
class CategoriesContainer extends StatefulWidget {
  final bool isIncome;

  const CategoriesContainer({Key? key, required this.isIncome})
      : super(key: key);

  @override
  _CategoriesContainerState createState() => _CategoriesContainerState();
}

class _CategoriesContainerState extends State<CategoriesContainer> {
  List<Map<String, dynamic>> incomeCategories = [
    {"name": "Salary", "isSelected": true, "type": "income"},
    {"name": "College", "isSelected": false, "type": "income"},
    {"name": "Loan", "isSelected": false, "type": "income"},
  ];

  List<Map<String, dynamic>> expenseCategories = [
    {"name": "Phone", "isSelected": true, "type": "expense"},
    {"name": "Internet", "isSelected": false, "type": "expense"},
    {"name": "Food", "isSelected": false, "type": "expense"},
    {"name": "Bills", "isSelected": false, "type": "expense"},
    {"name": "Car", "isSelected": false, "type": "expense"},
    {"name": "Pet", "isSelected": false, "type": "expense"},
    {"name": "Travel", "isSelected": false, "type": "expense"},
    {"name": "Charity", "isSelected": false, "type": "expense"},
    {"name": "Sports", "isSelected": false, "type": "expense"},
    {"name": "Health", "isSelected": false, "type": "expense"},
  ];

  Map<String, IconData> incomeCategoryIcons = {
    "Salary": CustomIcons.clarity_dollar_bill_line,
    "College": CustomIcons.mdi_college_outline,
    "Loan": CustomIcons.ph_hand_coins,
  };

  Map<String, IconData> expenseCategoryIcons = {
    "Phone": CustomIcons.phone,
    "Internet": CustomIcons.mingcute_wifi_fill,
    "Food": CustomIcons.food,
    "Bills": CustomIcons.akar_icons_thunder,
    "Car": CustomIcons.car,
    "Pet": CustomIcons.pet,
    "Travel": Icons.flight,
    "Home": Icons.home,
    "Charity": CustomIcons.mdi_charity,
    "Sports": CustomIcons.ion_football,
    "Health": CustomIcons.travel,
  };

  List<Map<String, dynamic>> get categories =>
      widget.isIncome ? incomeCategories : expenseCategories;

  Map<String, IconData> get categoryIcons =>
      widget.isIncome ? incomeCategoryIcons : expenseCategoryIcons;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Categories', style: CustomStyle.goalTextStyle),
              Icon(
                Icons.add_circle,
                color: CustomColors.navorappbar,
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize),
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            children: categories
                .map((category) => CategoryItem(
                      name: category["name"],
                      icon: category["type"] == "income"
                          ? incomeCategoryIcons[category["name"]]
                          : expenseCategoryIcons[category["name"]],
                      isSelected: category["isSelected"],
                      onPressed: () {
                        setState(() {
                          categories.forEach((cat) {
                            cat["isSelected"] = cat["name"] == category["name"];
                          });
                        });
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String name;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategoryItem({
    Key? key,
    required this.name,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        width: 65.w,
        height: 65.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: isSelected
              ? CustomColors.navorappbar
              : CustomColors.navorappbar.withOpacity(0.6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(height: 2.0),
            Text(
              name,
              style: TextStyle(
                  color: Colors.white, fontSize: Dimensions.headingTextSize5),
            ),
          ],
        ),
      ),
    );
  }
}
