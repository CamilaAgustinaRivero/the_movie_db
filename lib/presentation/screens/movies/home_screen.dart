import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge/presentation/providers/providers.dart';
import 'package:challenge/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final popularMovies = ref.watch(popularMoviesProvider);
    // final topRated = ref.watch(popularMoviesProvider);
    // final upcomingMovies = ref.watch(popularMoviesProvider);
    final moviesSlider = ref.watch(moviesSliderProvider);

    return Column(
      children: [
        const Appbar(),
        MoviesSlider(movies: moviesSlider),
        MoviesSection(title: 'Más populares', movies: popularMovies),
        // MoviesSection(title: 'Mejores calificadas', movies: topRated),
        // MoviesSection(title: 'Próximas películas', movies: upcomingMovies),
      ],
    );
  }
}
