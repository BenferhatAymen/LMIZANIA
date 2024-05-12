import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/transaction_view/transaction_group_view.dart';

class TransationCard extends StatelessWidget {
  TransationCard({Key? key, required this.transactionData}) : super(key: key);
  final Map transactionData;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionGroupView(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: TColor.themeColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(200),
              ),
              child: Icon(transactionData["categoryIcon"],
                  color: TColor.themeColor, size: 26),
            ),
            SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactionData["category"],
                    style: TextStyle(
                      color: TColor.themeColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 5),
                  Text(
                    transactionData["item"],
                    style: TextStyle(
                      color: TColor.themeColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Text(
              "${NumberFormat('#,###').format(int.parse(transactionData["amount"]))} Da",
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
