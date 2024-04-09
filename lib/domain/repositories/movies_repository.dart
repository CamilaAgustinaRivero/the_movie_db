import "package:challenge/domain/entities/movie.dart";

abstract class MoviesRepository {
  Future<List<Movie>> getPopular({int page = 1});
}
