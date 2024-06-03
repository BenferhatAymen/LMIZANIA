import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lmizania/data/models/category_model.dart';

class PieChartWidget extends StatefulWidget {
  PieChartWidget({super.key, required this.categories});
  List<CategoryModel> categories;

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  final List<Color> progressBarColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.cyanAccent,
    Colors.yellowAccent,
    Colors.teal,
    Colors.brown,
    Colors.indigoAccent,
    Colors.pink,
    Colors.lightGreen
  ];

  @override
  Widget build(BuildContext context) {
    return PieChart(
      swapAnimationDuration: Duration(milliseconds: 150),
      PieChartData(
        sections: widget.categories
            .map((category) => PieChartSectionData(
                  color: progressBarColors[widget.categories.indexOf(category) %
                      progressBarColors.length],
                  value: category.amount!.toDouble(),
                  title: category.name,
                  radius: 50,
                  titleStyle: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
