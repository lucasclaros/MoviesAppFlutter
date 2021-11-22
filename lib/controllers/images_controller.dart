import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../constants/constants.dart';
import '../controllers/movie_controller.dart';
import '../models/imdb_poster_model.dart';
import 'package:http/http.dart' as http;

class MoviePoster extends StatelessWidget {
  final String url;
  final String? id;

  const MoviePoster({Key? key, required this.url, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: url,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Image.asset('assets/tokenlab.png'), //GetImdbPoster(id: int.parse(id.toString()),),
    );
  }
}


///   This functions can be used when the poster_path from original
///  endpoint do not response a valid image. You can change the
///  Image.asset from MoviePoster function to GetImdbPoster (wich
///  requires the movie id from the original list).
class GetImdbPoster extends StatelessWidget {
  final int id;
  final _controller = MovieController();

  GetImdbPoster({Key? key, required this.id}) : super(key: key);

  Future<ImdbPoster> getPoster() async {
    await _controller.fetchMoviebyID(id);
    final responseImdb = await http.get(Uri.parse(Constants.DATA_IMDB_API + _controller.movie.imdbId.toString() + '/'), headers: Constants.headers);
    return imageFromJson(responseImdb.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ImdbPoster>(
      future: getPoster(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: snapshot.data!.results.banner,
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
          );
        } else if (snapshot.hasError) {
          return Center(child: Image.asset('assets/tokenlab.png'));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
