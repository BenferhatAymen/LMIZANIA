import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/transaction_view/pie_chart_painter.dart';
import 'package:lmizania/utils/filter_row.dart';
import 'package:lmizania/utils/group_card.dart';
import 'package:lmizania/utils/group_settings_card.dart';
import 'package:lmizania/utils/segment_button.dart';
import 'package:lmizania/utils/transaction_card.dart';
import 'package:lmizania/utils/transaction_section.dart';

class TransactionGroupView extends StatefulWidget {
  @override
  State<TransactionGroupView> createState() => _TransactionGroupViewState();
}

class _TransactionGroupViewState extends State<TransactionGroupView> {
  bool isPersonal = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bgColor,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xff00494C).withOpacity(0.95),
        title: Text(
          'Transaction',
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
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              InformationRow(title: "Ferrari", icon: Icons.car_rental),
              InformationRow(
                  title: "500.000 DA", icon: Icons.attach_money_outlined),
              InformationRow(title: "05 April 2024", icon: Icons.date_range),
              SizedBox(
                height: 15,
              ),
              PayingMembersContainer(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit, color: Colors.white),
                            Text(
                              "Edit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TColor.themeColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black.withOpacity(0.25),
                                width: 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            Text(
                              "Delete",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black.withOpacity(0.25),
                                width: 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationRow extends StatelessWidget {
  InformationRow({super.key, required this.title, required this.icon});
  String title;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: TColor.themeColor.withOpacity(0.4),
        ),
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: TColor.themeColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: TColor.themeColor, size: 26),
          ),
          SizedBox(
            width: 14,
          ),
          Container(
            width: media.width * 0.5,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class PayingMembersContainer extends StatelessWidget {
  PayingMembersContainer({super.key});
  var userData = [
    {
      "name": "Susan",
      "icon": "images/suzan.png",
      "color": Colors.blue,
      "amount": 15000 * 360 / 130000
    },
    {
      "name": "Roney",
      "icon": "images/roney.png",
      "color": Colors.green,
      "amount": 25000 * 360 / 130000
    },
    {
      "name": "Smith",
      "icon": "images/smith.png",
      "color": Colors.red,
      "amount": 30000 * 360 / 130000
    },
    {
      "name": "Karim lgang",
      "icon": "images/roney.png",
      "color": Colors.orange,
      "amount": 20000 * 360 / 130000
    },
    {
      "name": "Fethi jamal",
      "icon": "images/smith.png",
      "color": Colors.purple,
      "amount": 18000 * 360 / 130000
    },
    {
      "name": "Fadi ronaldo",
      "icon": "images/roney.png",
      "color": Colors.yellow,
      "amount": 22000 * 360 / 130000
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Paying members",
                style: TextStyle(
                  color: TColor.themeColor,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            child: Stack(children: [
              Container(
                width: media.width * 0.5,
                height: media.height * 0.116,
                child: CustomPaint(
                  // ignore: avoid_function_literals_in_foreach_calls
                  painter: PieChartPainter(
                    drwArcs: [
                      for (var i in userData)
                        ArcValueModel(
                          color: i["color"] as Color,
                          value: (i["amount"] as double),
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: media.height * 0.4,
                width: media.width * 0.5,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "130,000 DA",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: userData.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return PayingMemberWidget(userData: userData[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PayingMemberWidget extends StatelessWidget {
  const PayingMemberWidget({
    super.key,
    required this.userData,
  });

  final userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 13),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4), // Border width
            decoration:
                BoxDecoration(color: userData["color"], shape: BoxShape.circle),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(25), // Image radius
                child: Image.asset(userData["icon"]!, fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${(userData["amount"]! * 130000 / 360).toInt()} DA",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: TColor.themeColor),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
