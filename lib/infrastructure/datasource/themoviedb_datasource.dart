import 'package:dio/dio.dart';
import 'package:challenge/config/constants/enviroment.dart';
import 'package:challenge/domain/datasources/movies_datasource.dart';
import 'package:challenge/infrastructure/mappers/movie_mapper.dart';
import 'package:challenge/infrastructure/models/themoviedb/themoviedb_response.dart';
import 'package:challenge/domain/entities/movie.dart';

class TheMovieDBDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'http://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDBKey,
        'language': 'es-AR'
      }));

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular');
    final movieDBResponse = TheMovieDBResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }
}
