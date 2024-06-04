import 'package:intl/intl.dart';

class TransactionModel {
  String? type;
  int? amount;
  String? date;
  String? category;
  String? name;
  String? id;

  TransactionModel(
      {this.name, this.type, this.amount, this.date, this.category, this.id});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
        name: json['name'],
        amount: json['amount'],
        type: json['type'],
        date: json['date'],
        category: json['category'],
        id: json['_id']);
  }
}

DateTime parseDate(String dateStr) {
  return DateFormat('yyyy-MM-dd').parse(dateStr);
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

int getWeekOfMonth(DateTime date) {
  final firstDayOfMonth = DateTime(date.year, date.month, 1);
  final firstWeekday = firstDayOfMonth.weekday;
  return ((date.day + firstWeekday - 1) / 7).ceil();
}

bool isInLastMonth(DateTime date) {
  final now = DateTime.now();
  final firstDayOfLastMonth = DateTime(now.year, now.month - 1, 1);
  final lastDayOfLastMonth = DateTime(now.year, now.month, 0);
  return date.isAfter(firstDayOfLastMonth) &&
      date.isBefore(lastDayOfLastMonth.add(Duration(days: 1)));
}

List<Map<String, int>> sumByMonth(List<TransactionModel> transactions) {
  final Map<String, int> monthlySums = {};

  for (var transaction in transactions) {
    if (transaction.date != null && transaction.amount != null) {
      final date = parseDate(transaction.date!);
      final monthKey = DateFormat('MMMM').format(date);

      if (!monthlySums.containsKey(monthKey)) {
        monthlySums[monthKey] = 0;
      }

      monthlySums[monthKey] = monthlySums[monthKey]! + transaction.amount!;
    }
  }

  return monthlySums.entries.map((entry) => {entry.key: entry.value}).toList();
}

// List<Map<String, int>> sumByWeekOfLastMonth(
//     List<TransactionModel> transactions) {
//   final Map<String, int> weeklySums = {};

//   for (var transaction in transactions) {
//     if (transaction.date != null && transaction.amount != null) {
//       final date = parseDate(transaction.date!);
//       if (isInLastMonth(date)) {
//         final weekKey = 'Week ${getWeekOfMonth(date)}';

//         if (!weeklySums.containsKey(weekKey)) {
//           weeklySums[weekKey] = 0;
//         }

//         weeklySums[weekKey] = weeklySums[weekKey]! + transaction.amount!;
//       }
//     }
//   }

//   return weeklySums.entries.map((entry) => {entry.key: entry.value}).toList();
// }

// List<Map<String, int>> sumByDayOfLastWeek(List<TransactionModel> transactions) {
//   final Map<String, int> dailySums = {};

//   for (var transaction in transactions) {
//     if (transaction.date != null && transaction.amount != null) {
//       final date = parseDate(transaction.date!);
//       if (isInLastWeek(date)) {
//         final dayKey = DateFormat('dd-MM-yyyy').format(date);

//         if (!dailySums.containsKey(dayKey)) {
//           dailySums[dayKey] = 0;
//         }

//         dailySums[dayKey] = dailySums[dayKey]! + transaction.amount!;
//       }
//     }
//   }

//   return dailySums.entries.map((entry) => {entry.key: entry.value}).toList();
// }

List<Map<String, int>> getMonthlyTransactionSums(
    List<TransactionModel> transactions, String type) {
  Map<String, int> monthlySums = {};

  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
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

  for (var transaction in transactions) {
    if (transaction.date != null &&
        transaction.amount != null &&
        transaction.type == type) {
      DateTime date = dateFormat.parse(transaction.date!);
      String month =
          DateFormat('MMM').format(date); // Get abbreviated month name

      if (monthlySums.containsKey(month)) {
        monthlySums[month] = monthlySums[month]! + transaction.amount!;
      } else {
        monthlySums[month] = transaction.amount!;
      }
    }
  }

  return months.map((month) => {month: monthlySums[month] ?? 0}).toList();
}

List<String> days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

bool isInLastWeek(DateTime date) {
  final now = DateTime.now();
  final startOfThisWeek = now.subtract(Duration(days: now.weekday - 1));
  final startOfLastWeek = startOfThisWeek.subtract(Duration(days: 7));
  final endOfLastWeek = startOfThisWeek.subtract(Duration(days: 1));
  return date.isAfter(startOfLastWeek) &&
      date.isBefore(endOfLastWeek.add(Duration(days: 1)));
}

// DateTime parseDate(String dateString) {
//   return DateFormat('yyyy-MM-dd').parse(dateString);
// }

List<Map<String, int>> sumByDayOfLastWeek(
    List<TransactionModel> transactions, String type) {
  final Map<String, int> dailySums = {};

  for (var transaction in transactions) {
    if (transaction.date != null &&
        transaction.amount != null &&
        transaction.type == type) {
      final date = parseDate(transaction.date!);
      if (isInLastWeek(date)) {
        final dayKey = DateFormat('EEE')
            .format(date); // Get abbreviated day name (Sun, Mon, etc.)

        if (!dailySums.containsKey(dayKey)) {
          dailySums[dayKey] = 0;
        }

        dailySums[dayKey] = dailySums[dayKey]! + transaction.amount!;
      }
    }
  }

  // Ensure all days of the week are present in the result
  return days.map((day) => {day: dailySums[day] ?? 0}).toList();
}

int getTotalTransactionSum(List<TransactionModel> transactions, String type) {
  int totalSum = 0;

  for (var transaction in transactions) {
    if (transaction.amount != null && transaction.type == type) {
      totalSum += transaction.amount!;
    }
  }

  return totalSum;
}
