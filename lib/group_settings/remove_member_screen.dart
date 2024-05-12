import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';

class RemoveMemberScreen extends StatelessWidget {
  var userData = [
    {"name": "Susan", "icon": "images/suzan.png", "removed": "member"},
    {"name": "Roney", "icon": "images/roney.png", "removed": "removed"},
    {"name": "Smith", "icon": "images/smith.png", "removed": "removed"},
    {"name": "Karim lgang", "icon": "images/roney.png", "removed": "member"},
    {"name": "Fethi jamal", "icon": "images/smith.png", "removed": "member"},
    {"name": "Fadi ronaldo", "icon": "images/roney.png", "removed": "member"},
    {"name": "akram djanit", "icon": "images/smith.png", "removed": "removed"}
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          'Remove Members',
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
              return UserremovedWidget(removedData: userData[index]);
            },
          ),
        ),
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
              "Remove",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class UserremovedWidget extends StatelessWidget {
  const UserremovedWidget({
    super.key,
    required this.removedData,
  });

  final removedData;

  @override
  Widget build(BuildContext context) {
    if (removedData["removed"] == "removed") {
      return Container(
        margin: EdgeInsets.only(right: 8),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(4), // Border width
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(25), // Image radius
                  child: Image.asset(removedData["icon"]!, fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              removedData["name"]!,
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
                child: Image.asset(removedData["icon"]!, fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              removedData["name"]!,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }
  }
}
