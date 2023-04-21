import 'package:cat_trivia/data/network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiModule {
  @lazySingleton
  ApiClient get apiClient {
    Dio dio = Dio();
    return ApiClient(dio);
  }
}