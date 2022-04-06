import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:carbon_footprint/Helper/global_enum.dart';
import 'package:carbon_footprint/Model/api_response_model.dart';
import 'package:carbon_footprint/Model/file_upload_model.dart';
import 'package:path/path.dart';
import 'extension.dart';
import 'themes.dart';

class NetworkManager {
  static Dio _dio() {
    var headers = {
      "X-API-KEY": "123456",
      "Content-Type": "application/json",
      // "language-code": Themes.locale.languageCode,
      // "country-code": Themes.locale.countryCode
    };
    BaseOptions options = BaseOptions(connectTimeout: 20000, headers: headers);
    Themes.log("******Dio Header*****");
    prettyPrintJson(headers);
    Dio dio = Dio(options);
    return dio;
  }

  static Future<ApiResponse> get(
      {required String url, required Map<String, dynamic>? params}) async {
    Themes.log("url----->" + url);
    if (params != null) {
      Themes.log("******Params*****");
      prettyPrintJson(params);
    }
    return _mainCall(httpMethods: HttpMethods.POST, url: url, params: params);
  }

  static Future<ApiResponse> post(
      {required String url, required Map<String, dynamic>? params}) async {
    var userDetailsModel = await Themes.getUserData();
    if (userDetailsModel != null) {
      if (params == null) {
        params = {"login_id": userDetailsModel.loginId, "type": "1"};
      } else {
        if (!params.containsKey("login_id")) {
          params["login_id"] = userDetailsModel.loginId;
        }
        params["type"] = "1";
      }
    } else {
      if (params == null) {
        params = {"type": "1"};
      } else {
        params["type"] = "1";
      }
    }
    Themes.log("url----->" + url);
    Themes.log("******Params*****");
    prettyPrintJson(params);
    return _mainCall(httpMethods: HttpMethods.POST, url: url, params: params);
  }

  static Future<ApiResponse> uploadFile(
      {required String url,
      required Map<String, dynamic>? params,
      required List<FileUploadModel>? fileUploadList}) async {
    var userDetailsModel = await Themes.getUserData();
    if (userDetailsModel != null) {
      if (params == null) {
        params = {"login_id": userDetailsModel.loginId};
      } else {
        params["login_id"] = userDetailsModel.loginId;
      }
    }
    Themes.log("url----->" + url);
    Themes.log("******Params*****");
    prettyPrintJson(params!);
    FormData formData = new FormData();
    params.forEach((k, v) {
      formData.fields.add(MapEntry(k, v));
    });

    if (fileUploadList != null && fileUploadList.isNotEmpty) {
      fileUploadList.forEach((fileUploadModel) async {
        if (fileUploadModel.file.path.isNotEmpty) {
          String fileName = basename(fileUploadModel.file.path);
          var multipartFile = MultipartFile.fromFileSync(
              fileUploadModel.file.path,
              filename: fileName);
          formData.files.add(MapEntry(fileUploadModel.keyName, multipartFile));
          log("File Name : $fileName");
          log("File Size : ${fileUploadModel.file.lengthSync()}");
        }
      });
    }
    return _mainCall(httpMethods: HttpMethods.POST, url: url, params: formData);
  }

  static Future<ApiResponse> _mainCall(
      {required HttpMethods httpMethods,
      required String url,
      required var params}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return ApiResponse(
          apiResponseModel: null, error: "No Internet Connection");
    }
    try {
      late Response response;
      if (httpMethods == HttpMethods.GET) {
        response = await _dio().get(url, queryParameters: params);
      } else if (httpMethods == HttpMethods.POST) {
        response = await _dio().post(url, data: params);
      } else if (httpMethods == HttpMethods.PUT) {
        response = await _dio().put(url, data: params);
      } else if (httpMethods == HttpMethods.DELETE) {
        response = await _dio().delete(url, data: params);
      }
      if (response.statusCode == 200) {
        if (response.data is String) {
          Themes.log("######Response######");
          var data = json.decode(response.data);
          if (data != null && data is Map<String, dynamic>) {
            prettyPrintJson(data);
            return ApiResponse(
                apiResponseModel:
                    ApiResponseModel.fromJson(json.decode(response.data)),
                error: null);
          } else {
            Themes.log(response.data);
            return ApiResponse(apiResponseModel: null, error: "Response Error");
          }
        } else if (response.data is Map<String, dynamic>) {
          Themes.log("******Response*****");
          prettyPrintJson(response.data);
          return ApiResponse(
              apiResponseModel: ApiResponseModel.fromJson(response.data),
              error: null);
        } else {
          Themes.log("******Response*****");
          Themes.log(response.data);
        }
      }
      return ApiResponse(apiResponseModel: null, error: "Response Error");
    } on DioError catch (error) {
      Themes.log("Exception occured: $error");
      return ApiResponse(apiResponseModel: null, error: "Response error");
    }
  }
}

class ApiResponse {
  ApiResponseModel? apiResponseModel;
  String? error;
  ApiResponse({required this.apiResponseModel, required this.error});
}
