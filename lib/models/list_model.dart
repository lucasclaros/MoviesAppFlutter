import 'dart:convert';

List<ListModel> listFromJson(List str) => List<ListModel>.from((str).map((x) => ListModel.fromJson(x)));

class ListModel {
  ListModel({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.releaseDate,
  });

  final int id;
  final double voteAverage;
  final String title;
  final String posterUrl;
  final List<String> genres;
  final DateTime releaseDate;

  factory ListModel.fromJson(Map<String, dynamic> json) =>
      ListModel(
        id: json["id"],
        voteAverage: json["vote_average"].toDouble(),
        title: json["title"],
        posterUrl: json["poster_url"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        releaseDate: DateTime.parse(json["release_date"]),
      );
}
