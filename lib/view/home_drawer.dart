import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:carbon_footprint/helper/my_colors.dart';
import 'package:carbon_footprint/helper/themes.dart';
import 'package:carbon_footprint/model/assets.dart';
import 'package:carbon_footprint/model/side_drawer_model.dart';
import 'package:carbon_footprint/model/user_details_model.dart';
import 'package:carbon_footprint/provider/user_provider.dart';
import 'package:carbon_footprint/view/progress_list_page.dart';
import 'login_page.dart';

class HomeDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeDrawer({Key? key, required this.scaffoldKey}) : super(key: key);

  List<SideDrawerModel> _drawerList(BuildContext context) => [
        SideDrawerModel(
            name: "Home", image: Assets.home_icon, type: SideDrawerType.home),
        SideDrawerModel(
            name: "New Request",
            image: Assets.new_request,
            type: SideDrawerType.newRequest),
        SideDrawerModel(
            name: "Ongoing Request",
            image: Assets.ongoing_request,
            type: SideDrawerType.inProgressRequest),
        SideDrawerModel(
            name: "Completed Request",
            image: Assets.completed_request,
            type: SideDrawerType.completedRequest),
        SideDrawerModel(
            name: "Customer Support",
            image: Assets.customer_service,
            type: SideDrawerType.customerService),
        SideDrawerModel(
            name: "Logout",
            image: Assets.sign_out,
            type: SideDrawerType.logout),
      ];

  @override
  Widget build(BuildContext context) {
    List<SideDrawerModel> drawerList = _drawerList(context);
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 200),
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            alignment: Alignment.center,
            color: MyColors.appColor,
            child: SafeArea(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  child: Text(
                    'Hello John!',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        fontSize: 20),
                  ),
                  onTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              ),
            )),
        Flexible(
          child: ListView.builder(
            itemCount: drawerList.length,
            itemBuilder: (context, index) {
              return HomeDrawerList(
                sideDrawerModel: drawerList[index],
                index: index,
                scaffoldKey: scaffoldKey,
                onLanguageChanged: (value) {
                  // if (value) onLanguageChanged(value);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class HomeDrawerList extends StatelessWidget {
  final SideDrawerModel sideDrawerModel;
  final int index;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final ValueChanged<bool> onLanguageChanged;
  const HomeDrawerList(
      {Key? key,
      required this.sideDrawerModel,
      required this.index,
      required this.scaffoldKey,
      required this.onLanguageChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 15, 35),
        child: Row(children: <Widget>[
          const SizedBox(
            width: 10,
          ),
          SvgPicture.asset(
            sideDrawerModel.image,
            height: 30,
            width: 30,
            color: MyColors.appColor,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              sideDrawerModel.name,
              textAlign: TextAlign.start,
              style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              maxLines: 2,
              overflow: TextOverflow.visible,
            ),
          ),
          if (sideDrawerModel.type == SideDrawerType.notifications)
            Consumer<UserProvider>(builder: (context, userProvider, child) {
              return userProvider.notificationCount.isNotEmpty
                  ? Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        userProvider.notificationCount,
                        style: GoogleFonts.montserrat(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                      ),
                    )
                  : Container();
            }),
        ]),
      ),
      onTap: () {
        scaffoldKey.currentState?.openEndDrawer();
        switch (sideDrawerModel.type) {
          case SideDrawerType.home:
            break;
          case SideDrawerType.newRequest:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProgressListPage(
                title: "New Request",
                type: 0,
              ),
              settings: const RouteSettings(name: 'ProgressListPage'),
            ));
            break;
          case SideDrawerType.inProgressRequest:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProgressListPage(
                title: "Ongoing Request",
                type: 1,
              ),
              settings: const RouteSettings(name: 'ProgressListPage'),
            ));
            break;
          case SideDrawerType.completedRequest:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProgressListPage(
                title: "Completed Request",
                type: 2,
              ),
              settings: const RouteSettings(name: 'ProgressListPage'),
            ));
            break;
          // case SideDrawerType.Notifications:
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => NotificationPage()),
          //   );
          //   break;
          // case SideDrawerType.ChangeLanguage:
          //   scaffoldKey.currentState.openEndDrawer();
          //   _changeLanguage(
          //       Themes.locale.languageCode == ENGLISH ? ARABIC : ENGLISH);
          //   break;
          // case SideDrawerType.MyFavourites:
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => FavouriteListPage()),
          //   );
          //   break;
          // case SideDrawerType.HowItWorks:
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => HowItWorksPage()),
          //   );
          //   break;
          case SideDrawerType.customerService:
            Themes.call('800 327635');
            break;
          // case SideDrawerType.FeedBack:
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => FeedbackPage()),
          //   );
          //   break;
          // case SideDrawerType.AboutUs:
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => AboutUsPage()),
          //   );
          //   break;
          // case SideDrawerType.PrivacyPolicy:
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
          //   );
          //   break;
          // case SideDrawerType.TermsAndConditions:
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => TermsAndConditionPage()),
          //   );
          //   break;
          case SideDrawerType.logout:
            AwesomeDialog(
                    context: scaffoldKey.currentContext!,
                    dialogType: DialogType.INFO,
                    animType: AnimType.TOPSLIDE,
                    title: "LOGOUT",
                    desc: "Are you sure want to logout?",
                    btnOkText: "Yes",
                    btnCancelText: "No",
                    btnOkOnPress: () {
                      Navigator.of(scaffoldKey.currentContext!)
                          .pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                                settings:
                                    const RouteSettings(name: 'LoginPage'),
                              ),
                              (route) => false);
                    },
                    btnCancelOnPress: () {})
                .show();

            break;
        }
      },
    );
  }

  // _callLogout() async {
  //   Themes.showDialogLoader(scaffoldKey.currentContext);
  //   var deviceToken = await Themes.getFirebaseToken();
  //   ApiService.logout(logoutParam: LogoutParam(deviceToken: deviceToken))
  //       .then((apiResponse) {
  //     Themes.hideDialogLoader();
  //     if (apiResponse.apiResponseModel != null) {
  //       bool status = apiResponse.apiResponseModel.response.status;
  //       String msg = apiResponse.apiResponseModel.response.message;
  //       if (status) {
  //         Themes.clearUserData();
  //         scaffoldKey.currentContext.read<UserProvider>().userDetailsModel =
  //             null;
  //         scaffoldKey.currentContext
  //           ..read<UserProvider>().notificationCount = "";
  //       }
  //       Themes.showSnackBar(scaffoldState: scaffoldKey.currentState, msg: msg);
  //     } else {
  //       Themes.showSnackBar(
  //           scaffoldState: scaffoldKey.currentState, msg: apiResponse.error);
  //     }
  //   });
  // }

}

class VersionTextView extends StatefulWidget {
  const VersionTextView({Key? key}) : super(key: key);
  @override
  _VersionTextViewState createState() => _VersionTextViewState();
}

class _VersionTextViewState extends State<VersionTextView> {
  // PackageInfo _packageInfo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   //run code after build
    //   PackageInfo.fromPlatform().then((value) {
    //     setState(() {
    //       _packageInfo = value;
    //     });
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        "Version 1.0.0",
        textAlign: TextAlign.start,
        style: GoogleFonts.montserrat(
            fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
        overflow: TextOverflow.visible,
      ),
    );
  }
}
