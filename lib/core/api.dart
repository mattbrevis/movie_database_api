
import 'package:dio/dio.dart';

abstract class Api {
  static String key = "0eb13382277307e297948e3dbecb7325";
  static String urlApi = 'https://api.themoviedb.org/3';
  static String imageMovie = 'https://image.tmdb.org/t/p/original';


  static dynamic getDio(String path)async {
    final Dio dio= Dio();
    var response =await dio.get(urlApi+path, queryParameters: {'api_key': key});
    return response.data['results'];
  }
}