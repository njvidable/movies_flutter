// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:movies/domain/model/movies_result1.dart';
import 'package:movies/domain/model/movies_result2.dart';

class MovieResource {
  final dio = Dio();
  static const String _baseURL = "https://api.themoviedb.org/3/movie";
  static const String _apiKey = ">>API_KEY<<";

  static Future<Response<dynamic>> executeGet(dio, url) {
    return dio.get(url, queryParameters: { "api_key": _apiKey});
  }

  Future<MovieResult1Model?> getPopularMovies() async {
    const url = '$_baseURL/popular?language=en-US&page=1';
    try {
      final response = await executeGet(dio, url);
      final moviesList = movieResult1ModelFromJson(response.data);
      return moviesList;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<MovieResult1Model?> getBestMovies() async {
    const url = '$_baseURL/top_rated?language=en-US&page=1';
    try {
      final response = await executeGet(dio, url);
      final moviesList = movieResult1ModelFromJson(response.data);
      return moviesList;
    }  catch (e) {
      print(e);
      return null;
    }
  }

  Future<MovieResult2Model?> getComingMovies() async {
    const url = '$_baseURL/upcoming?language=en-US&page=1';
    try {
      final response = await executeGet(dio, url);
      final moviesList = movieResult2ModelFromJson(response.data);
      return moviesList;
    } catch (e) {
      print(e);
      return null;
    }
  }
  
}
