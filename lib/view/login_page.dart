import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carbon_footprint/Helper/api_params.dart';
import 'package:carbon_footprint/Helper/api_service.dart';
import 'package:carbon_footprint/Helper/extension.dart';
import 'package:carbon_footprint/Helper/my_colors.dart';
import 'package:carbon_footprint/Helper/themes.dart';
import 'package:carbon_footprint/Model/assets.dart';
import 'package:carbon_footprint/Model/user_details_model.dart';
import 'package:carbon_footprint/Provider/user_provider.dart';
import 'package:provider/provider.dart';
// import 'HomePage.dart';

import 'dart:math';
import 'package:flutter/painting.dart';

import 'common_bottom_navigation_bar.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  static final _placeHolderTextStyle = GoogleFonts.montserrat(
      color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 17);
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController(text: "E03296");
    _passwordController = TextEditingController(text: "Farnek123");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return DecoratedBox(
      // width: MediaQuery.of(context).size.width,
      // padding: const EdgeInsets.symmetric(vertical: 15),
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width(context), 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            primary: Colors.transparent,
            shadowColor: Colors.transparent),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const CommonBottomNavigationBar(),
                settings:
                    const RouteSettings(name: 'CommonBottomNavigationBar'),
              ),
              (route) => false);
        },
        child: Text('Login',
            style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'FARN',
          style: GoogleFonts.montserrat(
            // textStyle: Theme.of(context).textTheme.display1,
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: 'E',
              style: GoogleFonts.montserrat(
                  color: const Color(0xffe46b10),
                  fontWeight: FontWeight.w700,
                  fontSize: 40),
            ),
            TextSpan(
                text: 'K',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                )),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("User id"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: const BezierContainer()),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .3),
                  // _title(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 70.0,
                    ),
                    child: Image.asset(Assets.farnekLogo),
                  ),
                  const SizedBox(height: 50),
                  _emailPasswordWidget(),
                  const SizedBox(height: 20),
                  _submitButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  _callLogin() async {
    setState(() {
      _isLoading = true;
    });

    String deviceToken = await Themes.getFirebaseToken();

    LoginParams loginParams = LoginParams(
      type: "1",
      deviceToken: deviceToken,
      userName: _emailController.text,
      userPwd: _passwordController.text,
    );
    ApiService.login(loginParams: loginParams).then((apiResponse) {
      setState(() {
        _isLoading = false;
      });
      if (apiResponse.apiResponseModel != null &&
          apiResponse.apiResponseModel!.response != null) {
        bool status = apiResponse.apiResponseModel!.response!.status;
        if (status && apiResponse.apiResponseModel!.result != null) {
          Map<String, dynamic>? customerJson =
              apiResponse.apiResponseModel!.result!["login_details"];
          if (customerJson != null) {
            Themes.saveUserData(customerJson).then((value) {
              // context
              //     .read<UserProvider>()
              //     .userDetailsModel =
              //     UserDetailsModel.fromJson(customerJson);
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(
              //       builder: (context) => HomePage(),
              //       settings: RouteSettings(name: 'HomePage'),
              //     ),
              //         (route) => false);
            });
          }
        } else {
          String? message = apiResponse.apiResponseModel!.response?.message;
          Themes.showSnackBar(context: context, msg: message);
        }
      } else {
        Themes.showSnackBar(context: context, msg: apiResponse.error);
      }
    });
  }
}

class BezierContainer extends StatelessWidget {
  const BezierContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
      angle: -pi / 3.5,
      child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
        ),
      ),
    ));
  }
}

class ClipPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var path = new Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, height);
    path.lineTo(size.width, 0);

    /// [Top Left corner]
    var secondControlPoint = Offset(0, 0);
    var secondEndPoint = Offset(width * .2, height * .3);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    /// [Left Middle]
    var fifthControlPoint = Offset(width * .3, height * .5);
    var fiftEndPoint = Offset(width * .23, height * .6);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fiftEndPoint.dx, fiftEndPoint.dy);

    /// [Bottom Left corner]
    var thirdControlPoint = Offset(0, height);
    var thirdEndPoint = Offset(width, height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
