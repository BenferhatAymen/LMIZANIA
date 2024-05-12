import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/utils/transaction_text_field_with_suffix.dart';

class AddPayingMember extends StatelessWidget {
  var userData = [
    {"name": "Susan", "icon": "images/suzan.png", "user_type": "admin"},
    {"name": "Roney", "icon": "images/roney.png", "user_type": "member"},
    {"name": "Smith", "icon": "images/smith.png", "user_type": "member"},
    {"name": "Karim lgang", "icon": "images/roney.png", "user_type": "member"},
    {"name": "Fethi jamal", "icon": "images/smith.png", "user_type": "admin"},
    {"name": "Fadi ronaldo", "icon": "images/roney.png", "user_type": "member"},
    {"name": "akram djanit", "icon": "images/smith.png", "user_type": "admin"}
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Paying Member',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
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
                return UserAdminWidget(adminData: userData[index]);
              },
            ),
          ),
          ExtendedTransactionsTextFieldWithSuffix(),
          SizedBox(
            height: 10,
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
        ],
      ),
    );
  }
}

class UserAdminWidget extends StatelessWidget {
  const UserAdminWidget({
    super.key,
    required this.adminData,
  });

  final adminData;

  @override
  Widget build(BuildContext context) {
    if (adminData["user_type"] == "admin") {
      return Container(
        margin: EdgeInsets.only(right: 8),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(4), // Border width
              decoration: BoxDecoration(
                  color: TColor.themeColor, shape: BoxShape.circle),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(25), // Image radius
                  child: Image.asset(adminData["icon"]!, fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              adminData["name"]!,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(right: 8),
        child: Column(
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(29), // Image radius
                child: Image.asset(adminData["icon"]!, fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              adminData["name"]!,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }
  }
}

class ExtendedTransactionsTextFieldWithSuffix extends StatelessWidget {
  const ExtendedTransactionsTextFieldWithSuffix({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Container(
      height: 65,
      child: TextField(
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.black, fontSize: 20),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 30),
          fillColor: TColor.themeColor.withOpacity(0.2),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: TColor.themeColor.withOpacity(0.5),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: TColor.themeColor.withOpacity(0.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: TColor.themeColor.withOpacity(0.5),
            ),
          ),
          suffixIcon: Container(
            height: 20,
            width: 20,
            alignment: Alignment.center,
            child: Text(
              "DA ",
              style: TextStyle(
                color: TColor.themeColor.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 70,
            minHeight: 70,
          ),
          prefixIcon: Container(
            margin: EdgeInsets.only(left: 20, right: 5, top: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: TColor.themeColor.withOpacity(0.9),
            ),
            child: Icon(Icons.attach_money_outlined,
                color: Colors.white, size: 25),
          ),
        ),
      ),
    );
  }
}
