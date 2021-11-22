import 'package:flutter/material.dart';
import '../controllers/images_controller.dart';

class MoviePosterList extends StatelessWidget{
  final double paddingTop;
  final double paddingBottom;
  final double paddingRight;
  final double paddingLeft;
  final String posterUrl;
  final int movieId;

  const MoviePosterList(
      Key? key,
      this.paddingTop,
      this.paddingBottom,
      this.paddingRight,
      this.paddingLeft,
      this.posterUrl,
      this.movieId)
      : super(key: key
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, left: paddingLeft, right: paddingRight, bottom: paddingBottom),
      child: SizedBox(
        width: 80,
        height: 160,
        child: MoviePoster(url: posterUrl, id: movieId.toString()),//GetImdbImage(id: int.parse(movieId.toString()),)
      ),
    );
  }
}