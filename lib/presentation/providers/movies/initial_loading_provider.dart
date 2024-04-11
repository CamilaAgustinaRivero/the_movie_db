import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:challenge/presentation/providers/providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final moviesSlider = ref.watch(moviesSliderProvider).isEmpty;
  final popularMovies = ref.watch(popularMoviesProvider).isEmpty;
  final topRated = ref.watch(topRatedMoviesProvider).isEmpty;
  final upcomingMovies = ref.watch(upcomingMoviesProvider).isEmpty;
  
  if (moviesSlider || popularMovies || topRated || upcomingMovies) return true;
  
  return false;
});
