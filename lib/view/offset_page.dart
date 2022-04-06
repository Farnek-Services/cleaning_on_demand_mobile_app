import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carbon_footprint/view/payment_method_page.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiselect/multiselect.dart';
import 'package:carbon_footprint/helper/extension.dart';
import 'package:carbon_footprint/helper/my_colors.dart';
import 'package:carbon_footprint/helper/themes.dart';
import 'package:carbon_footprint/model/date_time_model.dart';
import 'package:carbon_footprint/model/location_list_model.dart';

class OffsetPage extends StatefulWidget {
  const OffsetPage({Key? key}) : super(key: key);

  @override
  _OffsetPageState createState() => _OffsetPageState();
}

class _OffsetPageState extends State<OffsetPage> {
  // List<DashboardListModel>? _dashboardList;
  List<LocationListModel>? _locationList;
  LocationListModel? _selectedLocation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _callDashboard();
    // });
  }

  _setList() {
    _locationList = [
      LocationListModel(
          imageUrl:
              "https://www.carbonfootprint.com/assets/2016_global_shop.jpg",
          locationTitle: "Global Portfolio",
          locationID:
              "Your funding supports our Global Portfolio VCS certified carbon reduction programmes.",
          price: "155.73",
          perTonne: "5.32"),
      LocationListModel(
          imageUrl:
              "https://www.carbonfootprint.com/assets/2016_uk_trees_shop.jpg",
          locationTitle: "Planting trees in the UK",
          locationID:
              "Your funding supports tree planting in the UK region of your choice.",
          price: "290.01",
          perTonne: "9.91"),
      LocationListModel(
          imageUrl:
              "https://www.carbonfootprint.com/assets/2017_americas_shop.jpg",
          locationTitle: "Americas Portfolio",
          locationID:
              "Your funding supports a carefully selected range of projects within the Americas region.",
          price: "336.94",
          perTonne: "11.51"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _setList();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Offset',
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade200,
        body: _mainView());
  }

  // Widget _loaderView(){
  //   return  Shimmer.fromColors(
  //     baseColor: Colors.grey.shade400,
  //     highlightColor: Colors.grey.shade200,
  //     enabled: true,
  //     child: GridView.builder(
  //         padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
  //         physics: NeverScrollableScrollPhysics(),
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             mainAxisSpacing: 10,
  //             crossAxisSpacing: 10,
  //             childAspectRatio: context.isPhone ?1.3:1.4,
  //             crossAxisCount: context.isPhone ? 2 : 3), itemCount:6 ,itemBuilder:(context,index){
  //       return Card(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8.0),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 "0",
  //                 textAlign: TextAlign.center,
  //                 style: GoogleFonts.montserrat(
  //                     color: Colors.white,
  //                     fontSize: 40,
  //                     fontWeight: FontWeight.w600
  //                 ),
  //               ),
  //               Text(
  //                 "Loading...",
  //                 textAlign: TextAlign.center,
  //                 style: GoogleFonts.montserrat(
  //                     color: Colors.white,
  //                     fontSize: 19,
  //                     fontWeight: FontWeight.w500
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     } ),);
  // }
  Widget _mainView() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          'Please choose one of the projects below',
          style: GoogleFonts.montserrat(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
              itemBuilder: (context, index) {
                LocationListModel locationListModel = _locationList![index];
                return _offsetView(locationListModel: locationListModel);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: _locationList?.length ?? 0),
        ),
      ],
    );
  }

  _offsetView({required LocationListModel locationListModel}) {
    return InkWell(
      onTap: () {
        // AwesomeDialog(
        //   context: context,
        //   dialogType: DialogType.SUCCES,
        //   animType: AnimType.TOPSLIDE,
        //   title: "Success",
        //   desc:
        //       "You have successfully donated to ${locationListModel.locationTitle!}",
        //   btnOkText: "OK",
        //   // btnCancelText: "No",
        //   btnOkOnPress: () {
        //     Navigator.of(context).pop();
        //   },
        //   // btnCancelOnPress: () {}
        // ).show();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                PaymentMethodPage(locationListModel: locationListModel),
            settings: const RouteSettings(name: 'PaymentMethodPage')));
      },
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: webImage(
                    imageUrl: locationListModel.imageUrl,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.fill),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                locationListModel.locationTitle ?? '',
                style: GoogleFonts.montserrat(
                    color: MyColors.appColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "You can download a personalised certificate",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _title(locationListModel),
              const SizedBox(
                height: 15,
              ),
              Text(
                locationListModel.locationID ?? '',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(LocationListModel locationListModel) {
    return RichText(
      textAlign: TextAlign.left,
      textScaleFactor: 1,
      text: TextSpan(
          text: 'AED ${locationListModel.price}',
          style: GoogleFonts.montserrat(
            // textStyle: Theme.of(context).textTheme.display1,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
          children: [
            TextSpan(
              text: ' to offset',
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            TextSpan(
                text: ' 29.274 tonnes\n',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
            TextSpan(
                text: '(AED ${locationListModel.perTonne} per tonne)',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
          ]),
    );
  }
}
