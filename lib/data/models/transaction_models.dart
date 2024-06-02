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
