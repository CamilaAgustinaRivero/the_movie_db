import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String theMovieDBKey = dotenv.env['THE_MOVIE_DB_KEY'] ?? 'No API key';
}