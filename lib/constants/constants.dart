import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Constants {
  static const String messageServerError = 'Failed to connect to the server. Try again later.';
  static const String messageInternetError = 'You\'re not connected to the internet!\n Please check your connections and try again later.';
  static const String messageMovieShare = 'You\'re not connected to the internet!\n Please check your connections and try again later.';
  static const String API_ENDPOINT = 'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';

  static const String IMDB_APIKEY = 'k_01ma5rf8';//'k_34t7z46e';
  static const String API_IMDB_POSTERS = 'https://imdb-api.com/en/API/Posters/'+IMDB_APIKEY;

  static const String DATA_IMDB_API = 'https://data-imdb1.p.rapidapi.com/movie/id/';
  static const Map<String, String> headers = {
    'x-rapidapi-host': 'data-imdb1.p.rapidapi.com',
    'x-rapidapi-key': '25f1cc81d4msh1586f9199becdd4p110e4ajsna10616dd16af',
  };

  static const String defaultFont = 'GothamBlack';
  static const Color borderColor = Color(0xff1a1a2e);
  static const Color backgroundColor = Color(0xff1f1f3f);
  static const Color starListColor = Colors.red;
  static const Color titleListColor = Colors.amber;
  static const MaterialColor primaryColor = MaterialColor(
      0xffda1a37,
      <int, Color> {
        50 : Color(0xffc71111),
        100: Color(0xffb10f0f),
        200: Color(0xff9b0d0d),
        300: Color(0xff850b0b),
        400: Color(0xff6f0a0a),
        500: Color(0xff580808),
        600: Color(0xff420606),
        700: Color(0xff2c0404),
        800: Color(0xff160202),
        900: Color(0xff000000),
      });

  static const TextStyle titleFontStyle = TextStyle(
      color: Constants.titleListColor,
      fontSize: 17.0,
      fontStyle: FontStyle.italic
  );
  static TextStyle selectedMovieTitleStyle = const TextStyle(
    color: Constants.primaryColor,
    fontSize: 25.0,
  );

  static const TextStyle genreFontStyle = TextStyle(
    color: Colors.white,
    fontSize: 15.0,
    fontFamily: 'Rimouski',
  );

  static const TextStyle selectedMovieFontStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    fontFamily: 'Rimouski',
  );

  static const TextStyle infoTitleStyle = TextStyle(
      decorationThickness: 3,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      fontSize: 20,
      color: Colors.amber
  );
}

//Dio
final dioOptions = BaseOptions(
  connectTimeout: 8000,
  receiveTimeout: 5000,
  contentType: 'application/json;charset=utf-8',
);