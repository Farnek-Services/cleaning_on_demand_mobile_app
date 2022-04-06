class Api {
  static const String base = "https://swashroom.farnek.com/";
  static const String baseUrl = base + "smartfm/api/";
  static const String login = baseUrl + "employees/login";
  static const String auditListTypes = baseUrl + "audits/auditlisttypes";
  static const String auditChecklist = baseUrl + "audits/auditchecklist";
  static const String auditCompletedChecklist = baseUrl + "audits/auditcompletedchecklist";
  static const String completedAuditDetails = baseUrl + "audits/completedauditDetails";
  static const String updateAudit = baseUrl + "audits/updateauditchecklist";
  static const String getAssets = baseUrl + "audits/getAssets";
  static const String logout = baseUrl + "logout";
  static const String DASHBOARD_URL = baseUrl + "tasks/dashboard";
  static const String locationRequestList = baseUrl + "contact/locationrequestlist";
  static const String footfallStatistics = baseUrl + "footfall/FootfallStatistics";
  static const String footfallDashboard = baseUrl + "footfall/footfalldashboard";

  //Google Api
  static const String googleGeocode =
      'https://maps.googleapis.com/maps/api/geocode/json';
}
