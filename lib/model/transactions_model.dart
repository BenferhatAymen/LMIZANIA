import 'package:flutter/material.dart';
import 'package:lmizania/widget/custom_icons.dart';

class Transaction {
  final String category;
  final String item;
  final int amount;
  final bool isIncome;
  final IconData icon;
  final DateTime date;

  Transaction( {
    required this.isIncome,
    required this.category,
    required this.icon,
    required this.item,
    required this.amount,
    required this.date,
  });
}

List<Transaction> transactions = [
  Transaction(
    category: 'Home',
    item: 'table',
    amount: 32000,
    date: DateTime.now(), icon: Icons.home, isIncome: false,
  ),
  Transaction(
    category: 'Vehicle',
    item: 'Gas',
    amount: 1000,
    date: DateTime.now(), icon: CustomIcons.car, isIncome: false,
  ),
  Transaction(
    category: 'Salary',
    item: 'company',
    amount: 1850000,
    date: DateTime.now(), icon: CustomIcons.clarity_dollar_bill_line, isIncome: true,
  ),
  Transaction(
    category: 'College',
    item: 'Bourse',
    amount: 2000,
    date: DateTime.now().subtract(const Duration(days: 1)), icon: CustomIcons.mdi_college_outline, isIncome: true,
  ),
  Transaction(
    category: 'College',
    item: 'Bourse',
    amount: 2000,
    date: DateTime.now().subtract(const Duration(days: 1)), icon: CustomIcons.mdi_college_outline, isIncome: true,
  ),
  Transaction(
    category: 'Travel',
    item: 'France',
    amount: 352000,
    date: DateTime.now().subtract(const Duration(days: 1)), icon: Icons.flight_takeoff, isIncome: false,
  ),
  Transaction(
    category: 'Food',
    item: 'Tacos',
    amount: 200,
    date: DateTime.now().subtract(const Duration(days: 5)), icon: CustomIcons.vector_1, isIncome: false,
  ),
  Transaction(
    category: 'Phone',
    item: 'Internet',
    amount: 1500,
    date: DateTime.now().subtract(const Duration(days: 5)), icon: CustomIcons.solar_phone_outline, isIncome: false,
  ),
  Transaction(
    category: 'Pet',
    item: 'Meat',
    amount: 3000,
    date: DateTime.now().subtract(const Duration(days: 5)), icon: CustomIcons.pet, isIncome: true,
  ),

  Transaction(
    category: 'Home',
    item: 'table',
    amount: 32000,
    date: DateTime.now().subtract(const Duration(days: 8)), icon: Icons.home, isIncome: false,
  ),
  Transaction(
    category: 'Vehicle',
    item: 'Gas',
    amount: 1000,
    date: DateTime.now().subtract(Duration(days: 8)), icon: CustomIcons.car, isIncome: false,
  ),
  Transaction(
    category: 'Salary',
    item: 'company',
    amount: 1850000,
    date: DateTime.now().subtract(Duration(days: 12)), icon: CustomIcons.clarity_dollar_bill_line_1, isIncome: true,
  ),
];

Map<String, List<Transaction>> groupTransactionsByDate(List<Transaction> transactions) {
  final groupedMap = <String, List<Transaction>>{};

  for (final transaction in transactions) {
    final formattedDate = formatDate(transaction.date); // Format the date here
    if (!groupedMap.containsKey(formattedDate)) {
      groupedMap[formattedDate] = [];
    }
    groupedMap[formattedDate]!.add(transaction);
  }

  return groupedMap;
}

String formatDate(DateTime date) {
  return date.toLocal().toString().substring(0, 10);
}


