import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/utils/transaction_card.dart';

class TransactionSection extends StatelessWidget {
  TransactionSection({super.key, required this.sectionData});
  Map sectionData;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionData["date"],
            style: TextStyle(
              color: TColor.themeColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: sectionData["items"].length,
            itemBuilder: (context, index) {
              return TransationCard(
                transactionData: sectionData["items"][index],
              );
            },
          ),
        ],
      ),
    );
  }
}
