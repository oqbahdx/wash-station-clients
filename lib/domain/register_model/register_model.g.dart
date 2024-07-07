// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
    };

RegisterModelError _$RegisterModelErrorFromJson(Map<String, dynamic> json) =>
    RegisterModelError(
      validationError: json['validationError'] as String?,
    );

Map<String, dynamic> _$RegisterModelErrorToJson(RegisterModelError instance) =>
    <String, dynamic>{
      'validationError': instance.validationError,
    };
