import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:carbon_footprint/model/user_details_model.dart';
import 'package:carbon_footprint/view/common_bottom_navigation_bar.dart';
import 'package:carbon_footprint/view/home_page.dart';
import 'helper/my_colors.dart';
import 'helper/themes.dart';
import 'provider/user_provider.dart';
import 'view/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserDetailsModel? userDetailsModel =
      (await Themes.getUserData()) as UserDetailsModel?;
  runApp(MyApp(userDetailsModel: userDetailsModel));
}

class MyApp extends StatefulWidget {
  final UserDetailsModel? userDetailsModel;
  const MyApp({Key? key, this.userDetailsModel}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FirebaseNotifications().setUpFirebase();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    UserProvider userProvider = UserProvider();
    userProvider.userDetailsModel = widget.userDetailsModel;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => userProvider,
        ),
      ],
      child: MaterialApp(
        navigatorKey: Themes.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'On Demand',
        theme: ThemeData(
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          textTheme: TextTheme(
            headline6:
                TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily),
          ),
          appBarTheme: AppBarTheme(
            color: MyColors.appColor,
            systemOverlayStyle: const SystemUiOverlayStyle(
                systemNavigationBarIconBrightness: Brightness.dark),
            centerTitle: true,
            titleTextStyle: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          primarySwatch: MyColors.appTheme,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: widget.userDetailsModel == null
            ? const LoginPage()
            : const CommonBottomNavigationBar(),
      ),
    );
  }
}
