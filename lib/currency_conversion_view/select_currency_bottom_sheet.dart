import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';

class SelectCurrencyBottomSheet extends StatefulWidget {
  @override
  State<SelectCurrencyBottomSheet> createState() =>
      _SelectCurrencyBottomSheetState();
}

class _SelectCurrencyBottomSheetState extends State<SelectCurrencyBottomSheet> {
  List<String> currencyList = [
    "United States (USD)",
    "Euro (EUR)",
    "United Kingdom (GBP)",
    "Canada (CAD)",
    "Australia (AUD)",
    "Japan (JPY)",
    "Mexico (MXN)",
    "Brazil (BRL)",
    "India (INR)",
    "Russia (RUB)",
    "South Africa (ZAR)",
    "Saudi Arabia (SAR)"
  ];
  String selectedCurrency = "United States (USD)";

  void selectCurrency(String currency) {
    setState(() {
      selectedCurrency = currency;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Container(
      height: media.height * 0.8,
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Currency',
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
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: currencyList.length,
              itemBuilder: (context, index) {
                return CurrencyRow(
                  currencyName: currencyList[index],
                  isSelected: selectedCurrency == currencyList[index],
                  onTap: () {
                    setState(() {
                      selectCurrency(currencyList[index]);
                    });
                  },
                );
              },
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
      ),
    );
  }
}

class CurrencyRow extends StatelessWidget {
  CurrencyRow(
      {super.key,
      required this.currencyName,
      required this.isSelected,
      this.onTap});
  String currencyName;
  bool isSelected;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Row(children: [
              Text(
                currencyName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Icon(
                isSelected ? Icons.check_circle_rounded : null,
                color: Color(0xff5233FF),
                size: 30,
              ),
            ]),
            Divider(
              color: Colors.black.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }
}
