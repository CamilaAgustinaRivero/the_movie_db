import 'package:challenge/config/helpers/number_formats.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:challenge/domain/entities/movie.dart';

class MoviesSection extends StatelessWidget {
  final List<Movie> movies;
  final String title;
  final VoidCallback? loadNextPage;

  const MoviesSection(
      {super.key,
      required this.movies,
      required this.title,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 450,
        child: Column(
          children: [
            if (title.isNotEmpty) _Title(title: title),
            Expanded(
              child: ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _Slide(movie: movies[index]);
                  }),
            ),
          ],
        ));
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title({required this.title});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [if (title.isNotEmpty) Text(title, style: titleStyle)],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                  width: 180,
                  height: 250,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const Padding(
                        padding: EdgeInsets.all(8),
                        child: Center(
                            child: CircularProgressIndicator(strokeWidth: 2)),
                      );
                    }
                    return FadeIn(child: child);
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
                width: 180,
                height: 20,
                child: Text(
                  movie.title,
                  maxLines: 2,
                  style: textStyles.titleSmall,
                )),
            const SizedBox(height: 10),
            SizedBox(
              width: 180,
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow.shade800),
                  const SizedBox(width: 5),
                  Text('${movie.voteAverage}', style: textStyles.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
              ]),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 180,
              child: Row(
                children: [
                  const SizedBox(height: 10),
                  Text('Reproducciones: ${NumberFormats.number(movie.popularity)}', style: textStyles.bodyMedium),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
