import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:challenge/domain/entities/movie.dart';
import 'package:challenge/presentation/providers/movies/movie_details_provider.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';
  final String movieId;
  
  const MovieScreen({
    super.key,
    required this.movieId,
  });

  @override
  ConsumerState<MovieScreen> createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieDetailsProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieDetailsProvider)[widget.movieId];

    if (movie == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator(strokeWidth: 2)));
    }
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _MovieAppbar(movie: movie),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) => _MovieDetails(movie: movie),
            childCount: 1
          )),
        ],
      )
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;
  const _MovieDetails({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie.title, style: textStyles.titleLarge),
          const SizedBox(height: 10),
          Text(movie.overview, style: textStyles.bodyLarge),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('Fecha de estreno:', style: textStyles.titleMedium),
              const SizedBox(width: 10),
              Text(DateFormat('yyyy-MM-dd').format(movie.releaseDate), style: textStyles.titleMedium),
            ],
          ),
          const SizedBox(height: 10),
          Text('Géneros:', style: textStyles.titleMedium),
          Row(
            children: [
              ...movie.genreIds.take(4).map((genre) => Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                    color: const Color(0xFFDB1518),
                    borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(genre, style: textStyles.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold))
                    ),
                  ),
                ),
              ))
            ],
          ),
          const SizedBox(height: 100),
          // actores
        ],
      ),
    );
  }
}

class _MovieAppbar extends StatelessWidget {
  final Movie movie;
  const _MovieAppbar({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.8,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.8, 1],
                    colors: [Colors.transparent, Colors.black87]),
                ),
              )
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    stops: [0.0, 0.4],
                    colors: [Colors.black87, Colors.transparent]),
                ),
              )
            ),
          ],
        )
      ),
    );
  }
}