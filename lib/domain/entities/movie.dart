class Movie {
  final bool adult;
  final bool video;
  final DateTime releaseDate;
  final double popularity;
  final double voteAverage;
  final int id;
  final int voteCount;
  final List<String> genreIds;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String title;

  Movie(
      {required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});
}
