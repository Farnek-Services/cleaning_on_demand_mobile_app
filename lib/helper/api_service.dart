import 'package:carbon_footprint/Model/file_upload_model.dart';

import 'api.dart';
import 'api_params.dart';
import 'network_manager.dart';

class ApiService {
  // login
  static Future<ApiResponse> login({required LoginParams loginParams}) async {
    final apiResponse =
        await NetworkManager.post(url: Api.login, params: loginParams.toJson());
    return apiResponse;
  }

  static Future<ApiResponse> getAuditListTypes() async {
    final apiResponse =
        await NetworkManager.post(url: Api.auditListTypes, params: null);
    return apiResponse;
  }

  static Future<ApiResponse> auditDetails(
      {required AuditDetailsParams auditDetailsParams}) async {
    final apiResponse = await NetworkManager.post(
        url: Api.completedAuditDetails, params: auditDetailsParams.toJson());
    return apiResponse;
  }

  static Future<ApiResponse> getAuditCheckList(
      {required LocationListParams locationListParams}) async {
    final apiResponse = await NetworkManager.post(
        url: Api.auditChecklist, params: locationListParams.toJson());
    return apiResponse;
  }

  static Future<ApiResponse> getAssets(
      {required AssetsListParams assetsListParams}) async {
    final apiResponse = await NetworkManager.post(
        url: Api.getAssets, params: assetsListParams.toJson());
    return apiResponse;
  }

  static Future<ApiResponse> updateAudit(
      {required UpdateAuditParams updateAuditParams,
      required List<FileUploadModel> fileUploadList}) async {
    final apiResponse = await NetworkManager.uploadFile(
        url: Api.updateAudit,
        params: updateAuditParams.toJson(),
        fileUploadList: fileUploadList);
    return apiResponse;
  }

  static Future<ApiResponse> logout({required LogoutParam logoutParam}) async {
    final apiResponse = await NetworkManager.post(
        url: Api.logout, params: logoutParam.toJson());
    return apiResponse;
  }

  static Future<ApiResponse> dashboard() async {
    final apiResponse =
        await NetworkManager.post(url: Api.DASHBOARD_URL, params: null);
    return apiResponse;
  }

  static Future<ApiResponse> getAuditCompletedCheckList() async {
    final apiResponse = await NetworkManager.post(
        url: Api.auditCompletedChecklist, params: null);
    return apiResponse;
  }

  static Future<ApiResponse> getLocationRequestList() async {
    final apiResponse =
        await NetworkManager.post(url: Api.locationRequestList, params: null);
    return apiResponse;
  }

  static Future<ApiResponse> getFootfallStatistics() async {
    final apiResponse =
        await NetworkManager.post(url: Api.footfallStatistics, params: null);
    return apiResponse;
  }

  static Future<ApiResponse> getFootfallDashboard(
      {required FootfallParams footfallParams}) async {
    final apiResponse = await NetworkManager.post(
        url: Api.footfallDashboard, params: footfallParams.toJson());
    return apiResponse;
  }
}
