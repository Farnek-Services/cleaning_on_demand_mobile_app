import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carbon_footprint/helper/extension.dart';
import 'package:carbon_footprint/helper/my_colors.dart';
import 'package:carbon_footprint/model/location_list_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class PaymentMethodPage extends StatefulWidget {
  final LocationListModel locationListModel;
  const PaymentMethodPage({Key? key, required this.locationListModel})
      : super(key: key);
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  int _selectedBtn = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Payment Method',
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: _mainView());
  }

  Widget _mainView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Total Amount',
              style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              'AED ${widget.locationListModel.price}',
              style: GoogleFonts.montserrat(
                  color: MyColors.appColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Choose Your Payment Method',
            style: GoogleFonts.montserrat(
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              fixedSize: Size(width(context), 65),
              side: BorderSide(
                  width: 1,
                  color:
                      _selectedBtn == 1 ? MyColors.appColor : Colors.black87),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              setState(() {
                _selectedBtn = 1;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.credit_card,
                  size: 35,
                  color: _selectedBtn == 1 ? MyColors.appColor : Colors.black87,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Credit Card',
                  style: GoogleFonts.montserrat(
                      color: _selectedBtn == 1
                          ? MyColors.appColor
                          : Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                fixedSize: Size(width(context), 65),
                side: BorderSide(
                    width: 1,
                    color:
                        _selectedBtn == 2 ? MyColors.appColor : Colors.black87),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                primary: Colors.white),
            onPressed: () {
              setState(() {
                _selectedBtn = 2;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "resources/images/apple_pay.png",
                  width: 40,
                  height: 40,
                  color: _selectedBtn == 2 ? MyColors.appColor : Colors.black87,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Apple Pay',
                  style: GoogleFonts.montserrat(
                      color: _selectedBtn == 2
                          ? MyColors.appColor
                          : Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                fixedSize: Size(width(context), 65),
                side: BorderSide(
                    width: 1,
                    color:
                        _selectedBtn == 3 ? MyColors.appColor : Colors.black87),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                primary: Colors.white),
            onPressed: () {
              setState(() {
                _selectedBtn = 3;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "resources/images/samsung_pay.png",
                  width: 40,
                  height: 40,
                  color: _selectedBtn == 3 ? MyColors.appColor : Colors.black87,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Samsung Pay',
                  style: GoogleFonts.montserrat(
                      color: _selectedBtn == 3
                          ? MyColors.appColor
                          : Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(width(context), 60),
                // side: const BorderSide(width: 2, color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: MyColors.appColor),
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.SUCCES,
                animType: AnimType.TOPSLIDE,
                title: "Payment Successfully Completed",
                desc:
                    "The certificate has been sent to your registered email address",
                btnOkText: "OK",
                // btnCancelText: "No",
                btnOkOnPress: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                        settings: const RouteSettings(name: 'HomePage'),
                      ),
                      (route) => false);
                },
                // btnCancelOnPress: () {}
              ).show();
            },
            child: Text(
              'Pay',
              style: GoogleFonts.montserrat(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
