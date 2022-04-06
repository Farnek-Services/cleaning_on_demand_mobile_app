import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carbon_footprint/view/book_cleaning_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carbon_footprint/Helper/extension.dart';
import 'package:carbon_footprint/helper/api_service.dart';
import 'package:carbon_footprint/helper/my_colors.dart';
import 'package:carbon_footprint/helper/themes.dart';
import 'package:carbon_footprint/view/login_page.dart';
import 'package:carbon_footprint/view/progress_list_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_drawer.dart';
import 'offset_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
            child: HomeDrawer(
          scaffoldKey: _scaffoldKey,
        )),
        appBar: AppBar(
          title: Text(
            'FARNEK',
            style: GoogleFonts.montserrat(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        resizeToAvoidBottomInset: false,
        body: _mainView());
  }

  Widget _mainView() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset(
        "resources/images/cleaning_animation.gif",
        fit: BoxFit.fill,
      ),
      // Center(
      //   child: Image.asset(
      //     "resources/images/carbonfootprintlogo.gif",
      //     fit: BoxFit.fill,
      //   ),
      // ),
      Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              _cardView(),
              const SizedBox(
                height: 20,
              ),
              _submitButton(),
            ],
          ),
        ),
      ),
    ]);
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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const BookCleaningPage(),
              settings: const RouteSettings(name: 'BookCleaningPage')));
        },
        child: Text(
          'Book a Cleaning',
          style: GoogleFonts.montserrat(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }

  Widget _cardView() {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      // color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hello John!',
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Facility: Tower A',
              style: GoogleFonts.montserrat(
                // textStyle: Theme.of(context).textTheme.display1,
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Location: Sheik Zayed road, Dubai',
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderView extends StatefulWidget {
  const SliderView({Key? key}) : super(key: key);
  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  int bannerIndex = 0;
  List<String> bannerImages = [
    // "https://travelmail.in/wp-content/uploads/2021/01/dubai-4044183_1280.jpg",
    "https://globallytoday.com/wp-content/uploads/2020/08/Dubai-electricity-696x369.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return _topView();
  }

  Widget _topView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (i, reason) {
                setState(
                  () {
                    bannerIndex = i;
                  },
                );
              },
              aspectRatio: 2 / 1.3,
              viewportFraction: 1,
              autoPlay: (bannerImages.length) > 1,
            ),
            items: bannerImages.map((e) {
              return Image.asset(
                "resources/images/carbonfootprint_slide.gif",
                fit: BoxFit.fill,
              );
            }).toList(),
          ),
          if ((bannerImages.length) > 1)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DotsIndicator(
                position: bannerIndex.toDouble(),
                decorator: const DotsDecorator(
                  color: Colors.black, // Inactive color
                  activeColor: Colors.white,
                ),
                onTap: (i) {
                  // setState(
                  //       () {
                  //     currenti1 = i;
                  //     cont1.nextPage();
                  //   },
                  // );
                },
                dotsCount: bannerImages.length,
              ),
            )
        ],
      ),
    );
  }
}
