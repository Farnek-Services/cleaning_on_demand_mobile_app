class LocationListModel {
  String? locationID;
  String? locationTitle;
  String price;
  String perTonne;
  final String imageUrl;

  LocationListModel(
      {required this.imageUrl,
      this.locationID,
      this.locationTitle,
      required this.price,
      required this.perTonne});
}
