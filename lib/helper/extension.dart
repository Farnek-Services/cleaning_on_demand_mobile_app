import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbon_footprint/Model/assets.dart';
import 'package:flutter/material.dart';

import 'themes.dart';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

bool validateMobile(String value) {
// Indian Mobile number are of 10 digit only
  if (value.length < 7)
    return false;
  else
    return true;
}

bool validatePassword(String value) {
  if (value.length < 6)
    return false;
  else
    return true;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

bool validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return false;
  else
    return true;
}

Widget webImage(
    {required String imageUrl,
    String placeholderImage = Assets.placeholder_image,
    double width = double.infinity,
    double height = double.infinity,
    BoxFit fit = BoxFit.cover}) {
  return imageUrl.isNotEmpty
      ? CachedNetworkImage(
          placeholder: (context, url) => Image.asset(
            placeholderImage,
            fit: fit,
            width: width,
            height: height,
          ),
          errorWidget: (context, url, il) => Image.asset(
            placeholderImage,
            fit: fit,
            width: width,
            height: height,
          ),
          imageUrl: imageUrl,
          fit: fit,
          width: width,
          height: height,
        )
      : Image.asset(
          placeholderImage,
          fit: fit,
          width: width,
          height: height,
        );
}

void prettyPrintJson(Map data) {
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final dynamic prettyString = encoder.convert(data);
  prettyString.split('\n').forEach((dynamic element) => Themes.log(element));
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension ContextExtension on BuildContext {
  bool get isTablet => MediaQuery.of(this).size.shortestSide >= 600;

  bool get isPhone => MediaQuery.of(this).size.shortestSide <= 600;
}
