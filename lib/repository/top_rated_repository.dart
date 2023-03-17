abstract class TopRatedRepository {
  static String route = '/movie/top_rated?';
  Future<dynamic> getTopRated(int page);
}