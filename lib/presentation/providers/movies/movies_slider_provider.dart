import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:challenge/domain/entities/movie.dart';
import 'package:challenge/presentation/providers/movies/movies_providers.dart';

final moviesSliderProvider = Provider<List<Movie>>((ref) {
  final popularMovies = ref.watch(popularMoviesProvider);
  if (popularMovies.isEmpty) return [];
  return popularMovies.sublist(0, 6);
});
