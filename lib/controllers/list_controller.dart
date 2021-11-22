import 'package:dartz/dartz.dart';
import '../models/list_model.dart';
import 'movie_api.dart';
import 'movie_error.dart';

class ListController{
  final _api = MovieApi();

  List<ListModel>? moviesList;
  MovieError? movieError;
  bool loading = true;

  Future<Either<MovieError, List<ListModel>>> fetchAllMovies() async {
    movieError = null;
    final result = await _api.fetchMoviesList();
    result.fold(
          (error) => movieError = error,
          (movies) => moviesList = movies,
    );
    return result;
  }
}