import 'package:json_annotation/json_annotation.dart';

part 'pending_requests_model.g.dart';


@JsonSerializable()
class PendingRequestsModel {
  String? message;
  String? status;
  List<PendingRequests>? pendingRequests;

  PendingRequestsModel({this.message, this.status, this.pendingRequests});

  factory PendingRequestsModel.fromJson(Map<String, dynamic> json) => _$PendingRequestsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PendingRequestsModelToJson(this);
}

@JsonSerializable()
class PendingRequests {
  int? id;
  int? clientId;
  int? workerId;
  String? serviceType;
  String? locationLong;
  String? locationLat;
  String? preferredTime;
  String? status;
  String? createdAt;
  String? updatedAt;

  PendingRequests(
      {this.id,
      this.clientId,
      this.workerId,
      this.serviceType,
      this.locationLong,
      this.locationLat,
      this.preferredTime,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory PendingRequests.fromJson(Map<String, dynamic> json) => _$PendingRequestsFromJson(json);

  Map<String, dynamic> toJson() => _$PendingRequestsToJson(this);
}
