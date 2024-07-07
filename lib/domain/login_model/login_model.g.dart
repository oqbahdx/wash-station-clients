// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isVerified: json['isVerified'] as bool?,
      clientPicture: json['clientPicture'] as String?,
      trash: json['trash'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'isVerified': instance.isVerified,
      'clientPicture': instance.clientPicture,
      'trash': instance.trash,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

LoginModelError _$LoginModelErrorFromJson(Map<String, dynamic> json) =>
    LoginModelError(
      message: json['message'] as String?,
    );

Map<String, dynamic> _$LoginModelErrorToJson(LoginModelError instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
