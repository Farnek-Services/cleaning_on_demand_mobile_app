enum SideDrawerType {
  home,
  myAccount,
  newRequest,
  inProgressRequest,
  completedRequest,
  notifications,
  settings,
  share,
  customerService,
  feedBack,
  aboutUs,
  privacyPolicy,
  termsAndConditions,
  logout
}

class SideDrawerModel {
  String name;
  String image;
  SideDrawerType type;
  SideDrawerModel(
      {required this.name, required this.image, required this.type});
}
