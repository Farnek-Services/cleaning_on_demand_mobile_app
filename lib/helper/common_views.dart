import 'package:carbon_footprint/Model/assets.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final String title;
  final String msg;
  final String imagePath;
  const EmptyView(
      {this.title = "Sorry",
      this.msg = "Something_went_wrong_\nPlease_try_again",
      this.imagePath = Assets.nodatafound});
  @override
  Widget build(BuildContext context) {
    var header = '';
    // if (title == "Sorry") {
    //   header = getTranslated(context).Sorry;
    // } else {
    header = title;
    // }
    // if (msg == "Something_went_wrong_\nPlease_try_again_") {
    //   msg =
    //   "${getTranslated(context, LanguageKey.Something_went_wrong_)}\n${getTranslated(context, LanguageKey.Please_try_again_)}";
    // }
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            fit: BoxFit.contain,
            width: 180,
            height: 180,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            header,
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 21),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            msg,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
