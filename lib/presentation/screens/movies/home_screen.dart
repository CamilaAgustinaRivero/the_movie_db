import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // por que static y no final ?
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Placeholder(),
    );
  }
}