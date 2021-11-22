class Movie {
  Movie({
    required this.adult,
    required this.backdropUrl,
    required this.genres,
    required this.id,
    required this.imdbId,
    required this.overview,
    required this.posterUrl,
    required this.releaseDate,
    required this.runtime,
    required this.spokenLanguages,
    required this.tagline,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropUrl;
  final List<String> genres;
  final int id;
  final String imdbId;
  final String overview;
  final String posterUrl;
  final DateTime releaseDate;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String tagline;
  final String title;
  final double voteAverage;
  final int voteCount;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    adult: json["adult"],
    backdropUrl: json["backdrop_url"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    id:  json["id"],
    imdbId: json["imdb_id"],
    overview: json["overview"],
    posterUrl: json["poster_url"],
    releaseDate: DateTime.parse(json["release_date"]),
    runtime: json["runtime"],
    spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
    tagline: json["tagline"],
    title: json["title"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );
}

class SpokenLanguage {
  SpokenLanguage({
    required this.iso6391,
    required this.name,
  });

  final String iso6391;
  final String name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
    iso6391: json["iso_639_1"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "iso_639_1": iso6391,
    "name": name,
  };
}
