import 'package:challenge/infrastructure/models/themoviedb/movie_themoviedb.dart';

class TheMovieDBResponse {
  TheMovieDBResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<MovieTheMovieDB> results;
  final int totalPages;
  final int totalResults;

  factory TheMovieDBResponse.fromJson(Map<String, dynamic> json) =>
      TheMovieDBResponse(
        page: json["page"],
        results: List<MovieTheMovieDB>.from(
            json["results"].map((x) => MovieTheMovieDB.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
