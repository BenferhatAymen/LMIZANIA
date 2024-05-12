import 'package:flutter/material.dart';

class NotificationsShowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          // leading: IconButton(
          //     icon: Icon(Icons.arrow_back), // Use any icon you prefer
          //     onPressed: () {
          //       Navigator.of(context).pop(); // Navigate back
          //     },
          //  alignment: Alignment.centerLeft, // Align the icon to the left
          // color: Colors.white, // Change the color of the icon
          // ),
          backgroundColor: Color(0xff00494C),
          title: Padding(
            padding: EdgeInsets.only(top: 32),
            child: Text(
              "Notifications",
              style: TextStyle(
                  fontFamily: "opensans",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(
                top: 28.0, left: 16.0), // Add top and left padding
            child: IconButton(
              icon: Icon(Icons.arrow_back), // Use any icon you prefer
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back
              },
              color: Colors.white, // Change the color of the icon
            ),
          ),
          // title: Container(child: Text("Notifications"))),
        ),
      ),
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 6),
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  "Loan to pay back",
                  style: TextStyle(
                    fontFamily: "opensans",
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            width: double.infinity,
            margin: EdgeInsets.only(
              top: 4,
            ),
            child: Text(
              "You borrowed 1,000 DA from riad",
              style: TextStyle(
                  fontFamily: "opensans",
                  fontSize: 13,
                  color: Color(0xff91919F)),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // Border color
                  width: 1, // Border width
                ),
              ),
            ),
          ),
          // kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk

          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Zakat",
              style: TextStyle(
                fontFamily: "opensans",
                fontSize: 16,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
            ),
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            width: double.infinity,
            child: Text(
              "your zakat for this year is 15,000 DA",
              style: TextStyle(
                  fontFamily: "opensans",
                  fontSize: 13,
                  color: Color(0xff91919F)),
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // Border color
                  width: 1, // Border width
                ),
              ),
            ),
          ),
          // kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk

          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Tips & articles",
              style: TextStyle(
                fontFamily: "opensans",
                fontSize: 16,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
            ),
            width: double.infinity,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            width: double.infinity,
            child: Text(
              "today’s tip is about saving more money",
              style: TextStyle(
                  fontFamily: "opensans",
                  fontSize: 13,
                  color: Color(0xff91919F)),
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // Border color
                  width: 1, // Border width
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
