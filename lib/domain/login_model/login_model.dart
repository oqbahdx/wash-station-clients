import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';


@JsonSerializable()
class LoginModel {
  User? user;
  String? token;

  LoginModel({this.user, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class User {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  bool? isVerified;
  String? clientPicture;
  int? trash;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.isVerified,
      this.clientPicture,
      this.trash,
      this.createdAt,
      this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class LoginModelError {
  String? message;

  LoginModelError({this.message});

  factory LoginModelError.fromJson(Map<String, dynamic> json) => _$LoginModelErrorFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelErrorToJson(this);
}
