import 'package:lmizania/utils/basic_imports.dart';

class SavingsModel {
  String? name, date;
  int? targetAmount, currentAmount;

  SavingsModel({this.name, this.targetAmount, this.currentAmount, this.date});

  factory SavingsModel.fromJson(Map<String, dynamic> json) {
    return SavingsModel(
        name: json['name'],
        targetAmount: json['targetAmount'],
        currentAmount: json['currentAmount'],
        date: json['date']);
  }
}
