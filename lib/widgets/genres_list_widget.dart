import 'package:flutter/material.dart';
import '../constants/constants.dart';

class GenresTitle extends StatelessWidget{
  final double paddingTop;
  final double paddingBottom;
  final double paddingRight;
  final double paddingLeft;
  final List<String> genres;

  const GenresTitle(
      Key? key,
      this.paddingTop,
      this.paddingBottom,
      this.paddingRight,
      this.paddingLeft,
      this.genres)
      : super(key: key
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, left: paddingLeft, right: paddingRight, bottom: paddingBottom),
      child: Row(
        children: [
          Expanded(
            child: RichText(text: TextSpan(
                children: [
                  const TextSpan(text: 'Genres: ', style: TextStyle(fontFamily: Constants.defaultFont, fontSize: 16.0, color: Colors.white)),
                  TextSpan(text: genres.toSet().toList().join(', '), style: Constants.genreFontStyle),
                ]
            )),
          ),
        ],
      ),
    );
  }
}