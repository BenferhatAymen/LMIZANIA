import 'package:lmizania/utils/basic_imports.dart';

class UserModel {
  String? firstName, lastName, email, dateOfBirth, gender, image;

  UserModel(
      {this.email,
      this.dateOfBirth,
      this.firstName,
      this.gender,
      this.lastName,
      this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        dateOfBirth: json["dateOfBirth"],
        gender: json["gender"],
        image: json["image"]);
  }
}
