// Register Request Params
import 'dart:convert';


// Login request params
class LoginParams {
  final String deviceToken;
  final String userName;
  final String userPwd;
  final String type;
  LoginParams({required this.type, required this.deviceToken, required this.userName, required this.userPwd});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['device_token'] = this.deviceToken;
    data['user_name'] = this.userName;
    data['user_pwd'] = this.userPwd;
    return data;
  }
}

class LocationListParams {
  final String templateId;
  final String contractId;

  LocationListParams({required this.templateId, required this.contractId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['templateid'] = this.templateId;
    data['contractid'] = this.contractId;
    return data;
  }
}
class AssetsListParams {
  final String locationId;
  final String contractId;
  AssetsListParams({required this.locationId, required this.contractId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_id'] = this.locationId;
    data['contract_id'] = this.contractId;
    return data;
  }
}

class AuditDetailsParams {
  final String templateId;
  final String contractId;
  final String locationId;
  final String postedDate;
  AuditDetailsParams({required this.locationId, required this.postedDate, required this.templateId, required this.contractId});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['template_id'] = this.templateId;
    data['contract_id'] = this.contractId;
    data['location_id'] = this.locationId;
    data['posted_date'] = this.postedDate;
    return data;
  }
}


class UpdateAuditParams {
  final String templateId;
  final String contractId;
  final String locationId;
  final String assetId;
  final List<ChecklistParams> checklist;

  UpdateAuditParams({
    required this.templateId,
    required this.contractId,
    required this.locationId,
    required this.assetId,
    required this.checklist});


  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['template_id'] = templateId;
    map['contract_id'] = contractId;
    map['location_id'] = locationId;
    map['asset_id'] = assetId;
    map['checklist'] = json.encode(checklist.map((v) => v.toJson()).toList());
    // map['checklist'] = checklist;
    return map;
  }

}

class ChecklistParams {
  String checklistId;
  String checklistOption;
  String comments;
  String imageCount;

  ChecklistParams({
    required this.checklistId,
    required this.checklistOption,
    required this.comments,
    required this.imageCount});


  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['checklist_id'] = checklistId;
    map['checklist_option'] = checklistOption;
    map['comments'] = comments;
    map['image_count'] = imageCount;
    return map;
  }
}

class LogoutParam {
  String deviceToken;
  LogoutParam({required this.deviceToken});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_token'] = this.deviceToken;
    return data;
  }
}

class FootfallParams {
  String fsid;
  FootfallParams({required this.fsid});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fsid'] = this.fsid;
    return data;
  }
}

