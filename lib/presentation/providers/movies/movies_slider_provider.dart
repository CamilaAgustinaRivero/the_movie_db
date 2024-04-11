import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:challenge/domain/entities/movie.dart';
import 'package:challenge/presentation/providers/movies/movies_providers.dart';

final moviesSliderProvider = Provider<List<Movie>>((ref) {
  final popularMovies = ref.watch(popularMoviesProvider);
  if (popularMovies.isEmpty) return [];

  final Random random = Random();
  final int startIndex = random.nextInt(max(0, popularMovies.length - 5));

  return popularMovies.sublist(startIndex, startIndex + 5);
});
