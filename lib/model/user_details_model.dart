class UserDetailsModel {
  String? loginName;
  String? loginId;
  String? fullname;
  String? designation;
  String? phone;

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    loginName = json['login_name'];
    loginId = json['login_id'];
    fullname = json['fullname'];
    designation = json['designation'];
    phone = json['phone'];
  }
}
