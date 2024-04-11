import 'package:dio/dio.dart';

import 'package:challenge/config/constants/enviroment.dart';
import 'package:challenge/domain/datasources/movies_datasource.dart';
import 'package:challenge/domain/entities/movie.dart';
import 'package:challenge/infrastructure/mappers/movie_mapper.dart';
import 'package:challenge/infrastructure/models/themoviedb/themoviedb_response.dart';

class TheMovieDBDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'http://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDBKey,
        'language': 'es-AR'
      }));
  
  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = TheMovieDBResponse.fromJson(json);
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {'page': page});
    return _jsonToMovies(response.data);
  }
  
  @override
    Future<List<Movie>> getTopRated({int page = 1}) async {
      final response = await dio.get('/movie/top_rated', queryParameters: {'page': page});
      return _jsonToMovies(response.data);
    }

  @override
    Future<List<Movie>> getUpcoming({int page = 1}) async {
      final response = await dio.get('/movie/upcoming', queryParameters: {'page': page});
      return _jsonToMovies(response.data);
    }
}
