import 'package:flutter/material.dart';
import 'package:lmizania/all_transactions_group/categories_modal_bottom_sheet.dart';
import 'package:lmizania/colors.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isIncome = true;
  List SortByTitleList = [
    "Newest",
    "Oldest",
    "Highest",
    "Lowest",
  ];
  String selectedItem = "Newest";
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 5,
              width: media.width * 0.12,
              decoration: BoxDecoration(
                color: TColor.themeColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text(
                "Filter transactions",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: TColor.themeColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Text(
                  "Reset",
                  style: TextStyle(
                    color: TColor.themeColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Sort By",
            style: TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Wrap(
            children: [
              for (int i = 0; i < SortByTitleList.length; i++)
                SortSegmentButton(
                    title: SortByTitleList[i],
                    isSelected: SortByTitleList[i] == selectedItem,
                    onTap: () {
                      setState(() {
                        selectedItem = SortByTitleList[i];
                      });
                    }),
            ],
          ),
          Text(
            "Category",
            style: TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CategoryChooseButton(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: CategoriesModalBottomSheet(),
                        ),
                      ),
                  isScrollControlled: true);
            },
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

class SortSegmentButton extends StatelessWidget {
  SortSegmentButton(
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
        alignment: Alignment.center,
        width: 100,
        margin: EdgeInsets.only(right: 6, bottom: 10),
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        decoration: BoxDecoration(
          color: isSelected ? TColor.themeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(
            color: Colors.black.withOpacity(0.15),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class CategoryChooseButton extends StatelessWidget {
  CategoryChooseButton(
      {super.key, this.numberOfSelectedItems = 0, required this.onTap});
  int numberOfSelectedItems;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        decoration: BoxDecoration(
          border: Border.all(color: TColor.themeColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              "Choose Categories",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            Spacer(),
            Text(
              "$numberOfSelectedItems selected",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: TColor.themeColor,
            ),
          ],
        ),
      ),
    );
  }
}
