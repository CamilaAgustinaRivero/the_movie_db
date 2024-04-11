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
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const Loader();
    
    final moviesSlider = ref.watch(moviesSliderProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRated = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topFiveStyle = Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold);
    
    return Visibility(
      visible: !initialLoading,
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(horizontal: 10),
              title: Appbar(),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                Text('Top 5', style: topFiveStyle),
                MoviesSlider(movies: moviesSlider),
                MoviesSection(
                    title: 'Más populares',
                    movies: popularMovies,
                    loadNextPage: () {
                      ref.read(popularMoviesProvider.notifier).loadNextPage();
                    }),
                MoviesSection(
                    title: 'Mejores calificadas',
                    movies: topRated,
                    loadNextPage: () {
                      ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                    }),
                MoviesSection(
                    title: 'Próximos estrenos',
                    movies: upcomingMovies,
                    loadNextPage: () {
                      ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                    }),
                const SizedBox(height: 50),
              ],
            );
          },
          childCount: 1
          ))
      ]),
    );
  }
}
