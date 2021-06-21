import 'package:dio/dio.dart';
import 'package:movie_app/data/api/api_client.dart';
import 'package:movie_app/data/models/movie/movie_info.dart';
import 'package:movie_app/data/models/movie/movie_result.dart';
import 'package:movie_app/data/models/show/show_info.dart';
import 'package:movie_app/data/models/show/show_result.dart';

class Repository {
  Dio _dio = Dio();

  late ApiClient _apiClient;

  var apiKey = "7567e45a49ce2c511f9240fec1edb428";

  Repository() {
    _dio = Dio();
    _apiClient = ApiClient(_dio);
  }

  Future<MovieResult> getMovies() {
    return _apiClient.getTopRatedMovies(apiKey);
  }

  Future<ShowResult> getShows() {
    return _apiClient.getTopRatedShows(apiKey);
  }

  Future<MovieInfo> getMovieById(int movieId) {
    return _apiClient.getMovieById(apiKey, movieId);
  }

  Future<ShowInfo> getShowById(int showId) {
    return _apiClient.getShowById(apiKey, showId);
  }

  Future<MovieResult> getMovieSearchResult(String query) async {
    return _apiClient.getMovieSearchResult(apiKey, query);
  }

  Future<ShowResult> getShowSearchResult(String query) async {
    return _apiClient.getShowSearchResult(apiKey, query);
  }
}
