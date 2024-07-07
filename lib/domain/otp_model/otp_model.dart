import 'package:json_annotation/json_annotation.dart';

part 'otp_model.g.dart';

@JsonSerializable()
class OTPModel {
  String? message;

  OTPModel({this.message});

  factory OTPModel.fromJson(Map<String, dynamic> json) => _$OTPModelFromJson(json);

  Map<String, dynamic> toJson() => _$OTPModelToJson(this);
}
