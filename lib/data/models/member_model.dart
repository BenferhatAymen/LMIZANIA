import 'package:lmizania/utils/basic_imports.dart';

class UserModel {
  String? name,image;

  UserModel(
      {this.name,
      this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
       name: json["name"],
        image: json["image"]);
  }
}
