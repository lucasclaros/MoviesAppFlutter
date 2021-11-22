import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../constants/constants.dart';
import '../controllers/movie_error.dart';
import '../models/movie_model.dart';
import '../models/list_model.dart';

class MovieApi {
  final Dio _dio = Dio(dioOptions);
  List<ListModel> movieList = <ListModel>[];

  Future<Either<MovieError, List<ListModel>>> fetchMoviesList() async {
    try{
      Response response = await _dio.get(Constants.API_ENDPOINT);
      movieList = listFromJson(response.data);
      return Right(movieList);
    } on DioError catch (error){
      if(error.response != null){
        return Left(
            MovieApiError(Constants.messageServerError)
        );
      }else{
        return Left(
            MovieApiError(Constants.messageInternetError)
        );
      }
    } on Exception catch (error){
      return Left(
          MovieApiError(error.toString())
      );
    }
  }

  Future<Either<MovieError, Movie>> fetchMoviebyID(int id) async {
    try{
      final response = await _dio.get('${Constants.API_ENDPOINT}/$id');
      final movie = Movie.fromJson(response.data);
      return Right(movie);
    } on DioError catch (error){
      if(error.response != null){
        return Left(MovieApiError(Constants.messageServerError));
      }else{
        return Left(MovieApiError(Constants.messageInternetError));
      }
    } on Exception catch (error){
      return Left(MovieApiError(error.toString()));
    }
  }
}