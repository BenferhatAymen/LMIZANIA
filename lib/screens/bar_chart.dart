import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/cubits/get_all_expense_cubit/get_all_expense_cubit.dart';
import 'package:lmizania/cubits/get_all_transactions_cubit/get_all_transactions_cubit.dart';
import 'package:lmizania/data/models/transaction_models.dart';

class BarChartWidget extends StatelessWidget {
  BarChartWidget({
    super.key,
    required this.transactions,
    required this.isIncome,
    required this.index,
  });

  final int index;
  final bool isIncome;
  final List<TransactionModel> transactions;

  final List<String> months = [
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

  final List<String> days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllTransactionsCubit, GetAllTransactionsState>(
      builder: (context, state) {
        if (state is GetAllTransactionsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetAllTransactionsSuccess) {
          List<TransactionModel> transactions = state.transactions;

          List<String> xAxis = index == 0 ? days : months;

          List<Map<String, int>> monthlySums = getMonthlyTransactionSums(
              transactions, isIncome ? "income" : "expense");

          List<Map<String, int>> dailySums =
              sumByDayOfLastWeek(transactions, isIncome ? "income" : "expense");

          List<Map<String, int>> sums = index == 0 ? dailySums : monthlySums;
          print(dailySums);
          int allSum = getTotalTransactionSum(
              transactions, isIncome ? "income" : "expense");
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
                      final style = TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      );
                      final int index = value.toInt();
                      if (index < 0 || index >= xAxis.length) {
                        return const SizedBox.shrink();
                      }
                      final text = Text(xAxis[index], style: style);
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 10.0,
                        child: text,
                      );
                    },
                    reservedSize: 32,
                  ),
                ),
              ),
              minY: 0,
              maxY: allSum.toDouble(),
              barGroups: sums.asMap().entries.map(
                (entry) {
                  final int index = entry.key;
                  final int value = entry.value.values.first;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: value.toDouble(),
                        color: isIncome ? TColor.themeColor : Colors.red,
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: allSum.toDouble(),
                          color: TColor.bgColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
            ),
          );
        } else {
          return Text("No data");
        }
      },
    );
  }
}
