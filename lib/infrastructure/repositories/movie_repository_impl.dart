import 'package:challenge/domain/entities/movie.dart';
import 'package:challenge/domain/repositories/movies_repository.dart';
import 'package:challenge/domain/datasources/movies_datasource.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }
}
