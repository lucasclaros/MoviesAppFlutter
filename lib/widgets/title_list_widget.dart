import 'package:flutter/material.dart';
import '../constants/constants.dart';

class TitleListWidget extends StatelessWidget{
  final double paddingTop;
  final double paddingBottom;
  final double paddingRight;
  final double paddingLeft;
  final String title;
  final int year;

  const TitleListWidget(
      Key? key,
      this.paddingTop,
      this.paddingBottom,
      this.paddingRight,
      this.paddingLeft,
      this.title,
      this.year)
      : super(key: key
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:6.5, left: 5.0),
      child: Text(title + " ("+year.toString()+")",
          style: Constants.titleFontStyle),
    );
  }
}