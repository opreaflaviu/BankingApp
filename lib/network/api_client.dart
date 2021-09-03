import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("/random")
  Future<List<int>> generateScore(
      @Query("min") int min,
      @Query("max") int max,
      @Query("count") int count);
}