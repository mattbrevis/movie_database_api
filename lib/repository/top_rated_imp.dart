import 'package:movie_database_api/controllers/api_controller.dart';
import 'package:movie_database_api/models/movie_model.dart';
import 'package:movie_database_api/repository/top_rated_repository.dart';

class TopRatedImp implements TopRatedRepository {
  @override
  Future<dynamic> getTopRated(int page) async {
    Map<String, dynamic> pageParam = {'page' : page};
    var response = await ApiController.getDio(TopRatedRepository.route, pageParam);
    var listTopRated = MovieModel.listFromJson(response['response']);
    int currentPage = response['page'];
    Map<String, dynamic> res = {'listTopRated' : listTopRated, 'currentPage' : currentPage};
    return res; 
  }
}
