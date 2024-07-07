// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_requests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingRequestsModel _$PendingRequestsModelFromJson(
        Map<String, dynamic> json) =>
    PendingRequestsModel(
      message: json['message'] as String?,
      status: json['status'] as String?,
      pendingRequests: (json['pendingRequests'] as List<dynamic>?)
          ?.map((e) => PendingRequests.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PendingRequestsModelToJson(
        PendingRequestsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'pendingRequests': instance.pendingRequests,
    };

PendingRequests _$PendingRequestsFromJson(Map<String, dynamic> json) =>
    PendingRequests(
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

Map<String, dynamic> _$PendingRequestsToJson(PendingRequests instance) =>
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
