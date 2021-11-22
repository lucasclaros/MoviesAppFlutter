import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../constants/constants.dart';

class RatingStartTitle extends StatelessWidget{
  final double paddingTop;
  final double paddingBottom;
  final double paddingRight;
  final double paddingLeft;
  final double average;

  const RatingStartTitle(
      Key? key,
      this.paddingTop,
      this.paddingBottom,
      this.paddingRight,
      this.paddingLeft,
      this.average)
      : super(key: key
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, left: paddingLeft, right: paddingRight, bottom: paddingBottom),
      child: Row(
        children: [
          RatingBar.builder(
            initialRating: average / 2.0,
            ignoreGestures: true,
            itemSize: 17,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star_sharp,
              color: Constants.starListColor,
            ),
            onRatingUpdate: (rating) {
            },
          ),
          Text(average.toString(), style: const TextStyle(fontSize: 14.0, color: Colors.white)),
        ],
      ),
    );
  }
}