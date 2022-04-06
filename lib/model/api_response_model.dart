class ApiResponseModel {
  int? code;
  ResponseModel? response;
  Map<String,dynamic>? result;

  ApiResponseModel({required this.code, required this.response, required this.result});

  ApiResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    response = json['response'] != null
        ?  ResponseModel.fromJson(json['response'])
        : null;
    result = (json['result'] != null && json['result'] is Map<String,dynamic>) ? json['result'] : null;
  }
}

class ResponseModel {
  late bool status;
  late String message;

  ResponseModel({required this.status, required this.message});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

}
