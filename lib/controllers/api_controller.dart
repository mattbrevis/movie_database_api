

import 'package:dio/dio.dart';
import 'package:movie_database_api/core/api.dart';

class ApiController {
  
  Future<String> authToken() async {
    final dio = Dio();  
    var response = await dio.get('${Api.urlApi}/authentication/token/new?api_key=${Api.key}');    
    return response.data['request_token'];    
  }

   static dynamic getDio(String path, Map<String,dynamic> queryP)async {
    queryP.addAll(Api.queryParameters);       
    final Dio dio= Dio();
    var response =await dio.get(Api.urlApi+path, queryParameters: queryP);   
    return response;
  }
}