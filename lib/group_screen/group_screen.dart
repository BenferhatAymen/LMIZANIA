import 'package:flutter/material.dart';
import 'package:lmizania/add_goal/add_goal_screen.dart';
import 'package:lmizania/all_transactions_group/all_transactions_group_view.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/edit_goal/edit_goal_screen.dart';
import 'package:lmizania/utils/desposit_alert_dialog.dart';
import 'package:lmizania/utils/goal_row.dart';
import 'package:lmizania/utils/group_card.dart';
import 'package:lmizania/utils/group_settings_card.dart';
import 'package:lmizania/utils/segment_button.dart';
import 'package:lmizania/utils/transaction_card.dart';
import 'package:lmizania/utils/transaction_section.dart';

import '../add_new_transaction/add_new_transaction_view.dart';

class GroupScreenView extends StatefulWidget {
  @override
  State<GroupScreenView> createState() => _GroupScreenViewState();
}

class _GroupScreenViewState extends State<GroupScreenView> {
  bool isPersonal = true;
  var groupData = {"name": "Family", "members": 5, "icon": "images/family.png"};
  var sectionData = [
    {
      "date": "Today",
      "items": [
        {
          "item": "Table",
          "category": "Home",
          "categoryIcon": Icons.home,
          "amount": "32000"
        },
        {
          "item": "Chair",
          "category": "Home",
          "categoryIcon": Icons.work,
          "amount": "15000"
        },
      ]
    },
    {
      "date": "Yesterday",
      "items": [
        {
          "item": "Desk",
          "category": "Home",
          "categoryIcon": Icons.work,
          "amount": "25000"
        },
      ]
    },
  ];
  var goalsData = [
    {
      "name": "Laptop",
      "duration": "6 months",
      "full_ammount": "140.000",
      "total_saving": "120.000",
      "icon": "images/laptop.png",
      "color": Color(0xffFD3C4A),
    },
    {
      "name": "House",
      "duration": "3 months",
      "full_ammount": "235.000",
      "total_saving": "164.500",
      "icon": "images/house.png",
      "color": Color(0xffFCAC12),
    },
    {
      "name": "Summer trip",
      "duration": "10 months",
      "full_ammount": "5.200.000",
      "total_saving": "2.600.000",
      "icon": "images/summer_trip.png",
      "color": Color(0xff7F3DFF),
    }
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
          'Group',
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
              GroupSettingsCard(
                groupData: groupData,
              ),
              SizedBox(
                height: 10,
              ),
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
                      'Recent Transations',
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNewTransactionView(),
                        ),
                      );
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
                height: 10,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: sectionData.length,
                itemBuilder: (context, index) {
                  return TransactionSection(sectionData: sectionData[index]);
                },
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 20, bottom: 15, top: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: TColor.themeColor.withOpacity(0.8), width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "All Transactions",
                        style: TextStyle(
                          color: TColor.themeColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_outward,
                        color: TColor.themeColor,
                        size: 26,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllTransactionsGroupView(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
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
                      'Group goals',
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddGoalScreen(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.add_circle,
                        color: TColor.themeColor,
                        size: 32,
                      )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: goalsData.length,
                itemBuilder: (context, index) {
                  return GoalRow(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditGoalScreen(),
                        ),
                      );
                    },
                    bObject: goalsData[index],
                    onDepositPressed: () async {
                      final result = await showDialog(
                          context: context,
                          builder: (context) {
                            return DepositAlertDialog();
                          });
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var sectionData = [
  {
    "date": "Today",
    "items": [
      {
        "item": "Table",
        "category": "Home",
        "categoryIcon": Icons.home,
        "amount": "32000"
      },
      {
        "item": "Chair",
        "category": "Home",
        "categoryIcon": Icons.work,
        "amount": "15000"
      },
      {
        "item": "Lamp",
        "category": "Decor",
        "categoryIcon": Icons.lightbulb,
        "amount": "8,500"
      }
    ]
  },
  {
    "date": "Yesterday",
    "items": [
      {
        "item": "Desk",
        "category": "Home",
        "categoryIcon": Icons.work,
        "amount": "25.000"
      },
      {
        "item": "Couch",
        "category": "Home",
        "categoryIcon": Icons.home,
        "amount": "45.000"
      }
    ]
  },
  {
    "date": "April 14, 2024",
    "items": [
      {
        "item": "Television",
        "category": "Electronics",
        "categoryIcon": Icons.tv,
        "amount": "60.000"
      }
    ]
  },
  {
    "date": "April 13, 2024",
    "items": [
      {
        "item": "Bed",
        "category": "Home",
        "categoryIcon": Icons.home,
        "amount": "55.000"
      },
      {
        "item": "Refrigerator",
        "category": "Appliances",
        "categoryIcon": Icons.kitchen,
        "amount": "40.000"
      }
    ]
  },
  {
    "date": "April 12, 2024",
    "items": [
      {
        "item": "Oven",
        "category": "Appliances",
        "categoryIcon": Icons.kitchen,
        "amount": "35.000"
      },
      {
        "item": "Microwave",
        "category": "Appliances",
        "categoryIcon": Icons.kitchen,
        "amount": "20.000"
      }
    ]
  }
];
