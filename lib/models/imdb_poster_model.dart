import 'dart:convert';

ImdbPoster imageFromJson(String str) => ImdbPoster.fromJson(json.decode(str));

class ImdbPoster {
  ImdbPoster({
    required this.results,
  });

  final Results results;

  factory ImdbPoster.fromJson(Map<String, dynamic> json) => ImdbPoster(
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "results": results.toJson(),
  };
}

class Results {
  Results({
    required this.banner,
  });

  final String banner;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    banner: json["banner"],
  );

  Map<String, dynamic> toJson() => {
    "banner": banner,
  };
}
