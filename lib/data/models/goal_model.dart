class GoalModel {
  String? name;
  String? id;
  String? description;
  int? targetAmount;
  int? currentAmount;
  String? image;

  GoalModel(
      {this.name,
      this.id,
      this.description,
      this.targetAmount,
      this.currentAmount,
      this.image});

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
        name: json['name'],
        id: json['_id'],
        description: json['description'],
        targetAmount: json['targetAmount'],
        currentAmount: json['currentAmount'],
        image: json['image']);
  }
}
