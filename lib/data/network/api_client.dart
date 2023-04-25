import 'package:cat_trivia/data/network/dto/cats_image_dto.dart';
import 'package:cat_trivia/data/network/endpoints.dart';
import 'package:cat_trivia/data/network/response/cats_fact_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(Endpoints.CatsFact)
  Future<CatsFactResponse> fetchCatsFact();

  @GET(Endpoints.CatsImage)
  Future<List<CatsImageDto>> fetchCatsImage();

}
