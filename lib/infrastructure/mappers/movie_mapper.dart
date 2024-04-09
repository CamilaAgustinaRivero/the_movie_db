import 'package:challenge/domain/entities/movie.dart';
import 'package:challenge/infrastructure/models/themoviedb/movie_themoviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieTheMovieDB themoviedb) => Movie(
      adult: themoviedb.adult,
      backdropPath: (themoviedb.backdropPath != ''
          ? 'https://image.tmdb.org/t/p/w500${themoviedb.backdropPath}'
          : 'no-poster'),
      genreIds: themoviedb.genreIds.map((e) => e.toString()).toList(),
      id: themoviedb.id,
      originalLanguage: themoviedb.originalLanguage,
      originalTitle: themoviedb.originalTitle,
      overview: themoviedb.overview,
      popularity: themoviedb.popularity,
      posterPath: (themoviedb.posterPath != ''
          ? 'https://image.tmdb.org/t/p/w500${themoviedb.posterPath}'
          : 'no-poster'),
      releaseDate: themoviedb.releaseDate,
      title: themoviedb.title,
      video: themoviedb.video,
      voteAverage: themoviedb.voteAverage,
      voteCount: themoviedb.voteCount);
}
