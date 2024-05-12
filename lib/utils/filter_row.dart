import 'package:flutter/material.dart';
import 'package:lmizania/all_transactions_group/filter_screen.dart';
import 'package:lmizania/colors.dart';

class FilterRowWidget extends StatefulWidget {
  FilterRowWidget({super.key});

  @override
  State<FilterRowWidget> createState() => _FilterRowWidgetState();
}

class _FilterRowWidgetState extends State<FilterRowWidget> {
  List<String> filterList = [
    "Today",
    "Yesterday",
    "Last week",
    "Last month",
    "Last Year"
  ];
  String selectedItem = "Today";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: FilterScreen(),
                        ),
                      ),
                  isScrollControlled: true);
            },
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
              child: Image.asset(
                "images/settings.png",
                height: 34,
                width: 26,
              ),
              decoration: BoxDecoration(
                color: TColor.themeColor,
                borderRadius: BorderRadius.circular(500),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          for (int i = 0; i < filterList.length; i++)
            FilterDateItem(
                title: filterList[i],
                isSelected: filterList[i] == selectedItem,
                onTap: () {
                  setState(() {
                    selectedItem = filterList[i];
                  });
                }),
        ],
      ),
    );
  }
}

class FilterDateItem extends StatelessWidget {
  FilterDateItem(
      {super.key,
      required this.title,
      this.isSelected = false,
      required this.onTap});
  String title;
  bool isSelected;

  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? TColor.themeColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.all(7),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
