import 'package:lmizania/utils/basic_imports.dart';

class CategoryModel {
  String? name;
  int? amount;

  CategoryModel({this.name, this.amount});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name'], amount: json['amount']);
  }
}
