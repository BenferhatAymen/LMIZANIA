class GroupModel {
  String? name;
  String? id;
  List<String>? members;
  String? admin;
  int? currentAmount;
  String? image;

  GroupModel({this.name, this.id, this.members, this.admin, this.image});

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      name: json['name'],
      id: json['_id'],
      image: json['image'],
      members: List<String>.from(json['members'].map((x) => x)),
      admin: json['admin'],
    );
  }
}
