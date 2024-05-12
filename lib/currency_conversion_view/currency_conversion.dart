import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/currency_conversion_view/select_currency_bottom_sheet.dart';
import 'package:lmizania/utils/filter_row.dart';
import 'package:lmizania/utils/group_card.dart';
import 'package:lmizania/utils/group_settings_card.dart';
import 'package:lmizania/utils/segment_button.dart';
import 'package:lmizania/utils/transaction_card.dart';
import 'package:lmizania/utils/transaction_section.dart';

class CurrencyConversionView extends StatefulWidget {
  @override
  State<CurrencyConversionView> createState() => _CurrencyConversionViewState();
}

class _CurrencyConversionViewState extends State<CurrencyConversionView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xff00494C).withOpacity(0.95),
        title: Text(
          'Currency Conversion',
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
          child: SizedBox(
            height: media.height * 0.88,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hintText: "Amount",
                  keyboardType: TextInputType.number,
                  suffixText: "USD",
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: SelectCurrencyBottomSheet(),
                              ),
                            ),
                        isScrollControlled: true);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hintText: "Amount",
                  keyboardType: TextInputType.number,
                  suffixText: "EUR",
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: SelectCurrencyBottomSheet(),
                              ),
                            ),
                        isScrollControlled: true);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Exchange rates are provided by google. Connect to the network to get the latest info.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.5,
                ),
                SizedBox(
                  width: media.width * 0.9,
                  height: media.height * 0.08,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Convert",
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
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hintText = "",
      this.keyboardType = TextInputType.text,
      this.initialValue,
      required this.suffixText,
      this.onTap});
  String hintText;
  TextInputType keyboardType;
  String? initialValue;
  String suffixText;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Container(
      height: 50,
      child: TextFormField(
        expands: true,
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
        keyboardType: keyboardType,
        initialValue: initialValue ?? null,
        maxLines: null,
        maxLength: null,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.4),
              fontSize: 15,
              fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.only(
            left: 30,
          ),
          fillColor: Colors.white,
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
          suffixIconConstraints: BoxConstraints(maxHeight: 80, maxWidth: 100),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(right: 15),
              height: 30,
              width: 80,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Text(
                    suffixText,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black.withOpacity(0.6),
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
