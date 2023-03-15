import 'package:movie_database_api/core/api.dart';
import 'package:movie_database_api/models/movie_model.dart';
import 'package:movie_database_api/repository/top_rated_repository.dart';

class TopRatedImp implements TopRatedRepository {
  @override
  Future<List<MovieModel>> getTopRated() async {
    var response = await Api.getDio(TopRatedRepository.route);
    var listTopRated = MovieModel.listFromJson(response);
    return listTopRated.isEmpty ? [] : listTopRated;
  }
}
