import 'package:dartz/dartz.dart';
import '../controllers/movie_api.dart';
import '../models/movie_model.dart';

import 'movie_error.dart';

class MovieController {
  final _api = MovieApi();

  late Movie movie;
  late MovieError? movieError;
  bool loading = true;

  Future<Either<MovieError, Movie>> fetchMoviebyID(int id) async {
    movieError = null;
    final result = await _api.fetchMoviebyID(id);
    result.fold(
          (error) => movieError = error,
          (m) => movie = m,
    );
    return result;
  }

}