
import 'package:movie_database_api/models/movie_model.dart';

abstract class TopRatedRepository {
  static String route = '/movie/top_rated?';
  Future<List<MovieModel>> getTopRated();
}