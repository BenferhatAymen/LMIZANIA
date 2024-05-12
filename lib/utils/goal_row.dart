import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';

class GoalRow extends StatelessWidget {
  GoalRow(
      {super.key,
      required this.bObject,
      required this.onDepositPressed,
      required this.onTap});
  final Map bObject;
  VoidCallback onDepositPressed;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final kGradientBoxDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xffCFCFFC).withOpacity(0.2),
          TColor.themeColor.withOpacity(0.35)
        ],
        begin: Alignment(-0.1, -1),
        end: Alignment(0.16, 1),
      ),
      borderRadius: BorderRadius.circular(16),
    );
    Size media = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        decoration: kGradientBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(0.8),
          child: Container(
            padding: EdgeInsets.only(left: 15, top: 20, right: 18, bottom: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage(
                        bObject["icon"],
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bObject["name"],
                          style: TextStyle(
                              color: TColor.themeColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Duration : ${bObject['duration']}",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: onDepositPressed,
                      child: Text(
                        "Deposit",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColor.themeColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      child: LinearProgressIndicator(
                        value: 0.8,
                        minHeight: 28,
                        backgroundColor: Colors.grey,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(bObject["color"]),
                      ),
                    ),
                    Positioned(
                      child: Center(
                        child: Text(
                          "${bObject['full_ammount']} DA",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Total saving",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${bObject['total_saving']} DA",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
