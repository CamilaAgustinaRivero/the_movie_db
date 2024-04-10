import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BottomAppBar(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: colors.primary),
            onPressed: () {
              // Acción a realizar cuando se presiona el botón
            },
          ),
        ],
      ),
    );
  }
}
