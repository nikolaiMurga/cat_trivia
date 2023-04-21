import 'package:cat_trivia/data/network/api_client.dart';
import 'package:cat_trivia/data/network/dto/fact_dto.dart';
import 'package:cat_trivia/data/network/dto/image_dto.dart';
import 'package:cat_trivia/data/repo/mapper/fact_mapper.dart';
import 'package:injectable/injectable.dart';

@injectable
class RandomFactNetworkRepo {
  final ApiClient _apiClient;
  final FactMapper _factMapper;

  RandomFactNetworkRepo(this._apiClient, this._factMapper);

  Future<FactDto> fetchRandomCatsFact() async {
    try {
      final response = await _apiClient.fetchRandomCatsFact();
      final dto = _factMapper.fromResponse(response);
      return dto;
    } catch (error) {
      rethrow;
    }
  }

  Future<ImageDto> fetchCatImage() async {
    try {
      final response = await _apiClient.fetchCatImage();
      final dto = response.first;
      return dto;
    } catch (error) {
      rethrow;
    }
  }
}
