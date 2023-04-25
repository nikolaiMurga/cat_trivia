import 'package:cat_trivia/data/network/api_client.dart';
import 'package:cat_trivia/data/network/dto/cats_fact_dto.dart';
import 'package:cat_trivia/data/network/dto/cats_image_dto.dart';
import 'package:cat_trivia/data/repo/mapper/cats_fact_mapper.dart';
import 'package:injectable/injectable.dart';

@injectable
class CatsFactNetworkRepo {
  final ApiClient _apiClient;
  final CatsFactMapper _catsFactMapper;

  CatsFactNetworkRepo(this._apiClient, this._catsFactMapper);

  Future<CatsFactDto> fetchCatsFact() async {
    try {
      final response = await _apiClient.fetchCatsFact();
      final dto = _catsFactMapper.fromResponse(response);
      return dto;
    } catch (error) {
      rethrow;
    }
  }

  Future<CatsImageDto> fetchCatsImage() async {
    try {
      final response = await _apiClient.fetchCatsImage();
      final dto = response.first;
      return dto;
    } catch (error) {
      rethrow;
    }
  }
}
