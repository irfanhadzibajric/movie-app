import 'package:dio/dio.dart';
import 'package:movie_app/data/models/movie/movie_info.dart';
import 'package:movie_app/data/models/movie/movie_result.dart';
import 'package:movie_app/data/models/show/show_info.dart';
import 'package:movie_app/data/models/show/show_result.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

class Apis {
  static const String topRatedMovies = "movie/top_rated";
  static const String topRatedShows = "tv/top_rated";
  static const String movieById = "movie/{movieId}";
  static const String showById = "tv/{showId}";
  static const String movieSearchResult = "search/movie";
  static const String showSearchResult = "search/tv";
}

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.topRatedMovies)
  Future<MovieResult> getTopRatedMovies(@Query("api_key") String apiKey);

  @GET(Apis.topRatedShows)
  Future<ShowResult> getTopRatedShows(@Query("api_key") String apiKey);

  @GET(Apis.movieById)
  Future<MovieInfo> getMovieById(
      @Query("api_key") String apiKey, @Path() int movieId);

  @GET(Apis.showById)
  Future<ShowInfo> getShowById(
      @Query("api_key") String apiKey, @Path() int showId);

  @GET(Apis.movieSearchResult)
  Future<MovieResult> getMovieSearchResult(
      @Query("api_key") String apiKey, @Query("query") String searchString);

  @GET(Apis.showSearchResult)
  Future<ShowResult> getShowSearchResult(
      @Query("api_key") String apiKey, @Query("query") String searchString);
}
