import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

class Apis {
  static const String topRatedMovies = "movie/top_rated";
  static const String topRatedShows = "tv/top_rated";
  static const String movieById = "/movie/{movieId}";
  static const String showById = "/tv/{showId}";
}

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // TODO: change dynamic to movieresult
  @GET(Apis.topRatedMovies)
  Future<dynamic> getTopRatedMovies(@Query("api_key") String apiKey);

  // TODO: change dynamic to showresult
  @GET(Apis.topRatedShows)
  Future<dynamic> getTopRatedShows(@Query("api_key") String apiKey);

  @GET(Apis.movieById)
  Future<dynamic> getMovieById(
      @Query("api_key") String apiKey, @Path() int movieId);

  @GET(Apis.showById)
  Future<dynamic> getShowById(
      @Query("api_key") String apiKey, @Path() int showId);
}
