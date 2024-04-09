import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge/infrastructure/repositories/movie_repository_impl.dart';
import 'package:challenge/infrastructure/datasource/themoviedb_datasource.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(TheMovieDBDatasource());
});