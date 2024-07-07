import 'package:json_annotation/json_annotation.dart';

part 'complete_requests_model.g.dart';

@JsonSerializable()
class CompleteRequestsModel {
  String? message;
  String? status;
  List<CompleteRequests>? completeRequests;

  CompleteRequestsModel({this.message, this.status, this.completeRequests});

  factory CompleteRequestsModel.fromJson(Map<String, dynamic> json) =>
      _$CompleteRequestsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteRequestsModelToJson(this);
}

@JsonSerializable()
class CompleteRequests {
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

  CompleteRequests(
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

  factory CompleteRequests.fromJson(Map<String, dynamic> json) =>
      _$CompleteRequestsFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteRequestsToJson(this);
}
