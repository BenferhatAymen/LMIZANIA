import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/utils/filter_row.dart';
import 'package:lmizania/utils/group_card.dart';
import 'package:lmizania/utils/group_settings_card.dart';
import 'package:lmizania/utils/segment_button.dart';
import 'package:lmizania/utils/transaction_card.dart';
import 'package:lmizania/utils/transaction_section.dart';

class AllTransactionsGroupView extends StatefulWidget {
  @override
  State<AllTransactionsGroupView> createState() =>
      _AllTransactionsGroupViewState();
}

class _AllTransactionsGroupViewState extends State<AllTransactionsGroupView> {
  bool isPersonal = true;
  var groupData = {"name": "Family", "members": 5, "icon": "images/family.png"};

  var sectionData = [
    {
      "date": "Today",
      "items": [
        {
          "item": "Table",
          "category": "Furniture",
          "categoryIcon": Icons.home,
          "amount": "32000000"
        },
        {
          "item": "Chair",
          "category": "Furniture",
          "categoryIcon": Icons.work,
          "amount": "15000"
        },
        {
          "item": "Lamp",
          "category": "Decor",
          "categoryIcon": Icons.lightbulb,
          "amount": "8500"
        }
      ]
    },
    {
      "date": "Yesterday",
      "items": [
        {
          "item": "Desk",
          "category": "Furniture",
          "categoryIcon": Icons.work,
          "amount": "25000"
        },
        {
          "item": "Couch",
          "category": "Furniture",
          "categoryIcon": Icons.home,
          "amount": "45000"
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
          "amount": "60000"
        }
      ]
    },
    {
      "date": "April 13, 2024",
      "items": [
        {
          "item": "Bed",
          "category": "Furniture",
          "categoryIcon": Icons.home,
          "amount": "55000"
        },
        {
          "item": "Refrigerator",
          "category": "Appliances",
          "categoryIcon": Icons.kitchen,
          "amount": "40000"
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
          "amount": "35000"
        },
        {
          "item": "Microwave",
          "category": "Appliances",
          "categoryIcon": Icons.kitchen,
          "amount": "20000"
        }
      ]
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
          'Transactions',
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
              FilterRowWidget(),
              SizedBox(
                height: 15,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: sectionData.length,
                itemBuilder: (context, index) {
                  return TransactionSection(sectionData: sectionData[index]);
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
        "category": "Furniture",
        "categoryIcon": Icons.home,
        "amount": "32,000"
      },
      {
        "item": "Chair",
        "category": "Furniture",
        "categoryIcon": Icons.work,
        "amount": "15,000"
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
        "category": "Furniture",
        "categoryIcon": Icons.work,
        "amount": "25,000"
      },
      {
        "item": "Couch",
        "category": "Furniture",
        "categoryIcon": Icons.home,
        "amount": "45,000"
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
        "amount": "60,000"
      }
    ]
  },
  {
    "date": "April 13, 2024",
    "items": [
      {
        "item": "Bed",
        "category": "Furniture",
        "categoryIcon": Icons.home,
        "amount": "55,000"
      },
      {
        "item": "Refrigerator",
        "category": "Appliances",
        "categoryIcon": Icons.kitchen,
        "amount": "40,000"
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
        "amount": "35,000"
      },
      {
        "item": "Microwave",
        "category": "Appliances",
        "categoryIcon": Icons.kitchen,
        "amount": "20,000"
      }
    ]
  }
];
