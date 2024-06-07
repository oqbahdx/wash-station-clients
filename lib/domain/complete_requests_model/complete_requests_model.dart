class CompleteRequestsModel {
  String? message;
  String? status;
  List<CompleteRequests>? completeRequests;

  CompleteRequestsModel({this.message, this.status, this.completeRequests});

  CompleteRequestsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['complete_requests'] != null) {
      completeRequests = <CompleteRequests>[];
      json['complete_requests'].forEach((v) {
        completeRequests!.add(CompleteRequests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (completeRequests != null) {
      data['complete_requests'] =
          completeRequests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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

  CompleteRequests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    workerId = json['worker_id'];
    serviceType = json['service_type'];
    locationLong = json['location_long'];
    locationLat = json['location_lat'];
    preferredTime = json['preferred_time'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['client_id'] = clientId;
    data['worker_id'] = workerId;
    data['service_type'] = serviceType;
    data['location_long'] = locationLong;
    data['location_lat'] = locationLat;
    data['preferred_time'] = preferredTime;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
