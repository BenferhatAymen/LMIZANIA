import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';

class CategoriesModalBottomSheet extends StatefulWidget {
  const CategoriesModalBottomSheet({super.key});

  @override
  State<CategoriesModalBottomSheet> createState() =>
      _CategoriesModalBottomSheetState();
}

class _CategoriesModalBottomSheetState
    extends State<CategoriesModalBottomSheet> {
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

  List<Map<String, dynamic>> get categories => expenseCategories;

  Map<String, IconData> get categoryIcons => expenseCategoryIcons;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Category",
            style: TextStyle(
              color: TColor.themeColor,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
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
          SizedBox(height: 20),
          SizedBox(
            width: media.width * 0.9,
            height: media.height * 0.08,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Apply",
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
