import 'package:dio/dio.dart';
import 'package:movie_app/data/models/movie/movie_result.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

class Apis {
  static const String topRated = "movie/top_rated";
}

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.topRated)
  // TODO: change dynamic to movieresult
  Future<dynamic> getTopRatedMovies(@Query("api_key") String apiKey);
}
