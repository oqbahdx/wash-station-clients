class PendingRequestsModel {
  String? message;
  String? status;
  List<PendingRequests>? pendingRequests;

  PendingRequestsModel({this.message, this.status, this.pendingRequests});

  PendingRequestsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['pending_requests'] != null) {
      pendingRequests = <PendingRequests>[];
      json['pending_requests'].forEach((v) {
        pendingRequests!.add(new PendingRequests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.pendingRequests != null) {
      data['pending_requests'] =
          this.pendingRequests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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

  PendingRequests.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_id'] = this.clientId;
    data['worker_id'] = this.workerId;
    data['service_type'] = this.serviceType;
    data['location_long'] = this.locationLong;
    data['location_lat'] = this.locationLat;
    data['preferred_time'] = this.preferredTime;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
