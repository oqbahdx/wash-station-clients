import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  String? phoneNumber;

  RegisterModel({this.phoneNumber});

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}

@JsonSerializable()
class RegisterModelError {
  String? validationError;

  RegisterModelError({this.validationError});

  factory RegisterModelError.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelErrorFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelErrorToJson(this);
}
