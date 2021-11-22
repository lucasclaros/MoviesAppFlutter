import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../views/movie_page.dart';
import '../widgets/genres_list_widget.dart';
import '../widgets/poster_list_widget.dart';
import '../widgets/rating_list_widget.dart';
import '../widgets/title_list_widget.dart';

class MovieRow extends StatelessWidget {
  final List movieList;
  final int index;

  const MovieRow({Key? key, required this.movieList, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: Border.all(
            color: Constants.borderColor,
            width: 6.0,
          )),
      child: InkWell(
        onTap: () { gotoMoviePage(context); },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded( flex: 3,
                  child: MoviePosterList(key, 4, 4, 4, 4, movieList[index].posterUrl, movieList[index].id),
                ),

                Expanded( flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleListWidget(key, 6.5, 0, 0, 5, movieList[index].title, movieList[index].releaseDate.year),
                      RatingStartTitle(key, 6.5, 0, 0, 3, movieList[index].voteAverage),
                      GenresTitle(key, 6.5, 0, 0, 9, movieList[index].genres),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  gotoMoviePage(context){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => MoviePage(movieID: movieList[index].id)),
    );
  }
}
