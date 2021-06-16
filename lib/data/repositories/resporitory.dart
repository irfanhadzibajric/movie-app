import 'package:dio/dio.dart';
import 'package:movie_app/data/api/api_client.dart';

class Repository {
  Dio _dio = Dio();

  late ApiClient _apiClient;

  var apiKey = "7567e45a49ce2c511f9240fec1edb428";

  Repository() {
    _dio = Dio();
    _apiClient = ApiClient(_dio);
  }

  // TODO: change dynamic to movieresult
  Future<dynamic> getMovies() {
    return _apiClient.getTopRatedMovies(apiKey);
  }

  // TODO: change dynamic to showresult
  Future<dynamic> getShows() {
    return _apiClient.getTopRatedShows(apiKey);
  }
}
