import 'package:flutter/material.dart';

Widget verticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget horizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

MainAxisAlignment mainStart = MainAxisAlignment.start;
MainAxisAlignment mainCenter = MainAxisAlignment.center;
MainAxisAlignment mainEnd = MainAxisAlignment.end;
MainAxisAlignment mainSpaceBet = MainAxisAlignment.spaceBetween;
MainAxisSize mainMax = MainAxisSize.max;
MainAxisSize mainMin = MainAxisSize.min;
CrossAxisAlignment crossStart = CrossAxisAlignment.start;
CrossAxisAlignment crossCenter = CrossAxisAlignment.center;
CrossAxisAlignment crossEnd = CrossAxisAlignment.end;
CrossAxisAlignment crossStretch = CrossAxisAlignment.stretch;
