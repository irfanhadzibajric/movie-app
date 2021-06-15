import 'package:dio/dio.dart';
import 'package:movie_app/data/api_client.dart';
import 'package:movie_app/data/models/movie/movie_result.dart';

class MovieRepository {
  Dio _dio = Dio();

  late ApiClient _apiClient;

  var apiKey = "7567e45a49ce2c511f9240fec1edb428";

  MovieRepository() {
    _dio = Dio();
    _apiClient = ApiClient(_dio);
  }

  // TODO: change dynamic to movieresult
  Future<dynamic> getMovies() {
    return _apiClient.getTopRatedMovies(apiKey);
  }
}
