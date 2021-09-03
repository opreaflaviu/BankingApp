

import 'package:banking_app/network/api_client.dart';
import 'package:dio/dio.dart';

class ApiManager {

  static final ApiManager apiManager = ApiManager._privateConstructor();

  late Dio _dio;
  late ApiClient _apiClient;

  ApiManager._privateConstructor() {
    _dio = Dio();
    _dio.options
      ..baseUrl = "http://www.randomnumberapi.com/api/v1.0"
      ..responseType = ResponseType.json;
    _apiClient = ApiClient(_dio);
  }

  Future<List<int>> generateScore() {
    return _apiClient.generateScore(1, 10, 1);
  }
}