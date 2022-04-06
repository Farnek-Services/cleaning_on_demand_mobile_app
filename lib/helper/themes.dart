import 'dart:convert';
// import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:carbon_footprint/Helper/constant.dart';
import 'package:carbon_footprint/Model/user_details_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'my_colors.dart';

class Themes {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // static SimpleFontelicoProgressDialog? _dialog;

  static Future<bool> isUserLoggedIn() async {
    var userDetailsModel = await Themes.getUserData();
    return userDetailsModel != null;
  }

  static void navigateMap(
      {required String orginLatLon, String? destinationLatLon}) async {
    String url = "https://www.google.com/maps/dir/?api=1&origin=" +
        orginLatLon +
        (destinationLatLon != null ? "&destination=" + destinationLatLon : '') +
        "&travelmode=driving&dir_action=navigate";
    String appUrl =
        "comgooglemaps://?saddr=$orginLatLon&daddr=$destinationLatLon&directionsmode=driving";
    if (await canLaunch(appUrl)) {
      await launch(appUrl);
    } else if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void launchMap({required String latLng}) async {
    String url = "https://www.google.com/maps/search/?api=1&query=" + latLng;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<UserDetailsModel?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'user_data';
    if (prefs.containsKey(key)) {
      final value = json.decode(prefs.getString(key)!);
      if (value != null) {
        Themes.log('Get User Data: $value');
        return UserDetailsModel.fromJson(value);
      }
    }
    return null;
  }

  static Future<bool> saveUserData(Map userData) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'user_data';
    final value = json.encode(userData);
    Themes.log('Save User Data $value');
    return prefs.setString(key, value);
  }

  static Future<bool> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'user_data';
    return prefs.remove(key);
  }

  static Future<bool> saveFirebaseToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'firebase_token';
    Themes.log('firebase_token $token');
    return prefs.setString(key, token);
  }

  static Future<String> getFirebaseToken() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'firebase_token';
    if (prefs.containsKey(key)) {
      final value = prefs.getString(key);
      if (value != null) {
        Themes.log('firebase_token: $value');
        return value;
      }
    }

    return '';
  }

  static Future<bool> saveAppData(Map userData) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'app_data';
    final value = json.encode(userData);
    Themes.log('Save App Data $value');
    return prefs.setString(key, value);
  }

  static Future<bool> saveCurrentLatitude(double lat) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'current_latitude';
    Themes.log('current_latitude $lat');
    return prefs.setDouble(key, lat);
  }

  static Future<double> getCurrentLatitude() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'current_latitude';
    if (prefs.containsKey(key)) {
      final value = prefs.getDouble(key);
      if (value != null) {
        Themes.log('current_latitude: $value');
        return value;
      }
    }
    return 0;
  }

  static Future<bool> saveCurrentLongitude(double lon) async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'current_longitude';
    Themes.log('current_longitude $lon');
    return prefs.setDouble(key, lon);
  }

  static Future<double> getCurrentLongitude() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'current_longitude';
    if (prefs.containsKey(key)) {
      final value = prefs.getDouble(key);
      if (value != null) {
        Themes.log('current_longitude: $value');
        return value;
      }
    }

    return 0;
  }

  static showSnackBar({required BuildContext context, String? msg}) {
    if (msg != null && msg.isNotEmpty) {
      final messenger = ScaffoldMessenger.of(context);
      messenger.showSnackBar(SnackBar(
        content: Text(
          msg,
        ),
        duration: const Duration(seconds: 1),
      ));
    }
  }

  static String dateToString(
      {required DateTime date, dateFormat = 'dd-MM-yyyy'}) {
    var formatter = DateFormat(dateFormat);
    String formatted = formatter.format(date);
    return formatted;
  }

  static String timeToString({required TimeOfDay tod, dateFormat = 'hh:mm a'}) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat(dateFormat);
    return format.format(dt);
  }

  static String getDateTime(
      {required DateTime date,
      required TimeOfDay tod,
      dateFormat = 'yyyy-MM-dd HH:mm:ss'}) {
    final dt = DateTime(date.year, date.month, date.day, tod.hour, tod.minute);
    final format = DateFormat(dateFormat);
    return format.format(dt);
  }

  static String stringDateFormat(
      {required String date, dateFormat = 'dd-MM-yyyy hh:mm a'}) {
    var parsedDate = DateTime.parse(date);
    return Themes.dateToString(date: parsedDate, dateFormat: dateFormat);
  }

  static Widget showLoader({Color? color}) {
    if (color == null) {
      return const CircularProgressIndicator();
    } else {
      return CircularProgressIndicator(backgroundColor: color);
    }
  }

  static showDialogLoader(BuildContext context) {
    // _dialog = SimpleFontelicoProgressDialog(context: context, barrierDimisable:  false);
    // _dialog!.show(message:"",hideText: true);
  }

  static hideDialogLoader() {
    // _dialog?.hide();
  }

  static void call(String number) => launch("tel:$number");

  static void sendSms(String number) => launch("sms:$number");

  static void sendEmail(String email) => launch("mailto:$email");

  static void log(dynamic value) {
    if (value != null) {
      if (Constant.isDebug) {
        print(value);
      }
    }
  }
}
