import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/data/models/bar_model.dart';
import 'package:lmizania/data/models/transaction_models.dart';

class BarChartWidget extends StatelessWidget {
  BarChartWidget({
    super.key,
    required this.transactions,
    required this.isIncome,
  });

  final bool isIncome;
  final List<TransactionModel> transactions;
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, int>> monthlySums =
        getMonthlyTransactionSums(transactions);

    return BarChart(
      BarChartData(
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 40),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                const style = TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                );
                Widget text = Text(months[value.toInt()], style: style);
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 8.0,
                  child: text,
                );
              },
              reservedSize: 32,
            ),
          ),
        ),
        minY: 0,
        maxY: 100,
        barGroups: monthlySums
            .asMap()
            .entries
            .map(
              (entry) => BarChartGroupData(
                x: entry.key,
                barRods: [
                  BarChartRodData(
                    toY: entry.value.values.first.toDouble(),
                    color: isIncome ? TColor.themeColor : Colors.red,
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 100,
                      color: TColor.bgColor.withOpacity(0.5),
                    ),
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
