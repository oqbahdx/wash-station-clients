class RegisterModel {
  String? phoneNumber;

  RegisterModel({this.phoneNumber});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    return data;
  }
}
class RegisterModelError {
  String? validationError;

  RegisterModelError({this.validationError});

  RegisterModelError.fromJson(Map<String, dynamic> json) {
    validationError = json['Validation error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Validation error'] = validationError;
    return data;
  }
}
