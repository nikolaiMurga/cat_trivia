import 'package:cat_trivia/data/network/dto/image_dto.dart';
import 'package:cat_trivia/data/network/endpoints.dart';
import 'package:cat_trivia/data/network/response/random_fact_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(Endpoints.randomFact)
  Future<RandomFactResponse> fetchRandomCatsFact();

  @GET(Endpoints.randomCatImage)
  Future<List<ImageDto>> fetchCatImage();

}
