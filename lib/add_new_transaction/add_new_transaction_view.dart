import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:lmizania/add_new_transaction/add_paying_member.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/utils/group_card.dart';
import 'package:lmizania/utils/group_settings_card.dart';
import 'package:lmizania/utils/segment_button.dart';
import 'package:lmizania/utils/transaction_card.dart';
import 'package:lmizania/utils/transaction_section.dart';
import 'package:lmizania/utils/transaction_text_field.dart';
import 'package:lmizania/utils/transaction_text_field_with_suffix.dart';

class AddNewTransactionView extends StatefulWidget {
  @override
  State<AddNewTransactionView> createState() => _AddNewTransactionViewState();
}

class _AddNewTransactionViewState extends State<AddNewTransactionView> {
  bool isPersonal = true;
  var groupData = {"name": "Family", "members": 5, "icon": "images/family.png"};
  var userData = [
    {
      "name": "Susan",
      "icon": "images/suzan.png",
    },
    {
      "name": "Roney",
      "icon": "images/roney.png",
    },
    {
      "name": "Smith",
      "icon": "images/smith.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bgColor,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xff00494C).withOpacity(0.95),
        title: Text(
          'New Transaction',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TransactionsTextField(),
              SizedBox(
                height: 15,
              ),
              TransactionsTextFieldWithSuffix(),
              SizedBox(height: 15),
              CategoriesContainer(
                isIncome: false,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5, right: 5, top: 2),
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Paying members',
                            style: TextStyle(
                              color: TColor.themeColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: AddPayingMember(),
                                      ),
                                    ),
                                isScrollControlled: true);
                          },
                          child: Icon(
                            Icons.add_circle,
                            color: TColor.themeColor,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: userData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return UserSelectedWidget(userData: userData[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: media.width * 0.9,
                height: media.height * 0.08,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColor.themeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

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
    {"name": "Health", "isSelected": false, "type": "expense"},
    {"name": "Education", "isSelected": false, "type": "expense"},
    {"name": "Shopping", "isSelected": false, "type": "expense"},
    {"name": "Travel", "isSelected": false, "type": "expense"},
    {"name": "Entertainment", "isSelected": false, "type": "expense"},
    {"name": "Groceries", "isSelected": false, "type": "expense"},
    {"name": "Fitness", "isSelected": false, "type": "expense"},
    {"name": "Home", "isSelected": false, "type": "expense"},
    {"name": "Utilities", "isSelected": false, "type": "expense"},
    {"name": "Gifts", "isSelected": false, "type": "expense"},
    {"name": "Clothing", "isSelected": false, "type": "expense"},
    {"name": "Beauty", "isSelected": false, "type": "expense"},
    {"name": "Books", "isSelected": false, "type": "expense"},
  ];

  Map<String, IconData> incomeCategoryIcons = {
    "Salary": Icons.attach_money,
    "College": Icons.school,
    "Loan": Icons.money_off,
  };

  Map<String, IconData> expenseCategoryIcons = {
    "Phone": Icons.phone,
    "Internet": Icons.wifi,
    "Food": Icons.fastfood,
    "Bills": Icons.receipt,
    "Car": Icons.directions_car,
    "Pet": Icons.pets,
    "Health": Icons.local_hospital,
    "Education": Icons.school,
    "Shopping": Icons.shopping_bag,
    "Travel": Icons.airplane_ticket,
    "Entertainment": Icons.movie,
    "Groceries": Icons.local_grocery_store,
    "Fitness": Icons.directions_run,
    "Home": Icons.home,
    "Utilities": Icons.flash_on,
    "Gifts": Icons.card_giftcard,
    "Clothing": Icons.shopping_cart,
    "Beauty": Icons.spa,
    "Books": Icons.menu_book,
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
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.add_circle,
                color: TColor.themeColor,
              ),
            ],
          ),
          SizedBox(height: 15),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
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
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: isSelected
              ? TColor.themeColor
              : TColor.themeColor.withOpacity(0.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.white : TColor.themeColor),
            SizedBox(height: 2.0),
            Text(
              name,
              style: TextStyle(
                color: isSelected ? Colors.white : TColor.themeColor,
                fontSize: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
    required this.userData,
  });

  final Map<String, String> userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(userData["icon"]!),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          userData["name"]!,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class UserSelectedWidget extends StatelessWidget {
  const UserSelectedWidget({
    super.key,
    required this.userData,
  });

  final userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Column(
        children: [
          ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(29), // Image radius
              child: Image.asset(userData["icon"]!, fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            userData["name"]!,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
