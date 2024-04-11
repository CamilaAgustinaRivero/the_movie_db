import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text('Swiss Movies', style: titleStyle),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
          ),
        ),
      ),
    );
  }
}
