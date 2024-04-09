import "package:challenge/domain/entities/movie.dart";

abstract class MoviesDatasource {
  Future<List<Movie>> getPopular({int page = 1});
}
