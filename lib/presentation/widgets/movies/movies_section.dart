import 'package:challenge/config/helpers/number_formats.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:challenge/domain/entities/movie.dart';

class MoviesSection extends StatefulWidget {
  final List<Movie> movies;
  final String title;
  final VoidCallback? loadNextPage;

  const MoviesSection(
      {super.key,
      required this.movies,
      required this.title,
      this.loadNextPage});

  @override
  State<MoviesSection> createState() => _MoviesSectionState();
}

class _MoviesSectionState extends State<MoviesSection> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(widget.loadNextPage == null) return;
      if((scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: Column(
          children: [
            if (widget.title.isNotEmpty) _Title(title: widget.title),
            Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: widget.movies.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _Slide(movie: widget.movies[index]);
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
              width: 170,
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow.shade800, size: 20),
                  Icon(Icons.star, color: Colors.yellow.shade800, size: 20),
                  Icon(Icons.star, color: Colors.yellow.shade800, size: 20),
                  const Spacer(),
                  Text(NumberFormats.number(movie.voteAverage), style: textStyles.bodyMedium?.copyWith(color: Colors.yellow.shade800, fontWeight: FontWeight.bold)),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
