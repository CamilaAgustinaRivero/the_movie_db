import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge/domain/entities/movie.dart';
import 'package:challenge/presentation/providers/movies/movies_repository_provider.dart';

final movieDetailsProvider = StateNotifierProvider<MovieNotifier, Map<String, Movie>> ((ref) {
  final getMovie = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieNotifier(getMovie: getMovie);
});

typedef GetMovieCallBack = Future<Movie>Function(String movieId);

class MovieNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallBack getMovie;

  MovieNotifier({
    required this.getMovie,
  }): super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}