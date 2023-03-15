

import 'package:dio/dio.dart';
import 'package:movie_database_api/core/api.dart';

class ApiController {
  
  Future<String> authToken() async {
    final dio = Dio();  
    var response = await dio.get('${Api.urlApi}/authentication/token/new?api_key=${Api.key}');    
    return response.data['request_token'];    
  }
}