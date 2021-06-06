import 'package:dio/dio.dart';
import 'package:ep_movie_app/core/api.dart';

class DioHelper {
  Dio _dio = Dio();

  DioHelper() {
    _dio = Dio();
  }

  Future<Response<Map<String, dynamic>>> getTrendingMovies() async {
    String _trendingUrl = makeTrendingUrl();
    Future<Response<Map<String, dynamic>>> _response;
    try {
      _response = _dio.get(_trendingUrl);
      //print(await _response);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return _response;
  }

  Future<Response<Map<String, dynamic>>> getUpcomingMovies() async {
    String _upcomingUrl = makeUpcomingUrl();
    Future<Response<Map<String, dynamic>>> _response;
    try {
      _response = _dio.get(_upcomingUrl);
      print(await _response);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return _response;
  }

  Future<Response<Map<String, dynamic>>> searchMovie(String searchKey) async {
    String _searchUrl = makeSearchUrl(searchKey);
    Future<Response<Map<String, dynamic>>> _response;
    try {
      _response = _dio.get(_searchUrl);
      print(await _response);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return _response;
  }
}
