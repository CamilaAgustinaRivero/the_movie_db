import 'package:flutter/material.dart';
import 'package:challenge/domain/entities/movie.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:animate_do/animate_do.dart';

class MoviesSlider extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 290,
        width: double.infinity,
        child: Swiper(
          viewportFraction: 0.8,
          scale: 0.9,
          autoplay: true,
          pagination: SwiperPagination(
              margin: const EdgeInsets.only(top: 0),
              builder: DotSwiperPaginationBuilder(
                  activeColor: colors.primary, color: colors.secondary)),
          itemCount: movies.length,
          itemBuilder: (context, index) => _Slide(movie: movies[index]),
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ]);
    const titleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

    return Column(
      children: [
        DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.backdropPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black12),
                    );
                  }
                  return FadeIn(child: child);
                },
              )),
        ),
        const SizedBox(height: 10),
        Text(movie.title, style: titleStyle, textAlign: TextAlign.center),
      ],
    );
  }
}
