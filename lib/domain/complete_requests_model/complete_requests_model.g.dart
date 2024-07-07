// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_requests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteRequestsModel _$CompleteRequestsModelFromJson(
        Map<String, dynamic> json) =>
    CompleteRequestsModel(
      message: json['message'] as String?,
      status: json['status'] as String?,
      completeRequests: (json['completeRequests'] as List<dynamic>?)
          ?.map((e) => CompleteRequests.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompleteRequestsModelToJson(
        CompleteRequestsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'completeRequests': instance.completeRequests,
    };

CompleteRequests _$CompleteRequestsFromJson(Map<String, dynamic> json) =>
    CompleteRequests(
      id: json['id'] as int?,
      clientId: json['clientId'] as int?,
      workerId: json['workerId'] as int?,
      serviceType: json['serviceType'] as String?,
      locationLong: json['locationLong'] as String?,
      locationLat: json['locationLat'] as String?,
      preferredTime: json['preferredTime'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CompleteRequestsToJson(CompleteRequests instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'workerId': instance.workerId,
      'serviceType': instance.serviceType,
      'locationLong': instance.locationLong,
      'locationLat': instance.locationLat,
      'preferredTime': instance.preferredTime,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
