import 'package:cat_trivia/data/repo/cats_fact/cats_fact_local_repo.dart';
import 'package:cat_trivia/data/repo/cats_fact/cats_fact_network_repo.dart';
import 'package:cat_trivia/data/repo/mapper/cats_fact_mapper.dart';
import 'package:cat_trivia/data/repo/mapper/cats_image_mapper.dart';
import 'package:cat_trivia/domain/models/fact_model.dart';
import 'package:cat_trivia/domain/models/image_model.dart';
import 'package:cat_trivia/domain/repo/cats_fact_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CatsFactRepo)
class CatsFactRepoImpl extends CatsFactRepo {
  final CatsFactNetworkRepo _catsFactNetworkRepo;
  final CatsFactLocalRepo _catsFactLocalRepo;
  final CatsFactMapper _catsFactMapper;
  final CatsImageMapper _catsImageMapper;

  CatsFactRepoImpl(this._catsFactNetworkRepo, this._catsFactLocalRepo, this._catsFactMapper, this._catsImageMapper);

  @override
  Future<CatsFactModel> fetchCatsFact() async {
    try {
      final dto = await _catsFactNetworkRepo.fetchCatsFact();
      final model = _catsFactMapper.fromDto(dto);
      await _catsFactLocalRepo.saveCatsFact(model);
      return model;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<ImageModel> fetchCatsImage() async {
    try {
      final dto = await _catsFactNetworkRepo.fetchCatsImage();
      final model = _catsImageMapper.fromDto(dto);
      return model;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<CatsFactModel>> getSavedFacts() async {
    try {
      final list = await _catsFactLocalRepo.getSavedFacts();
      return list;
    } catch (error) {
      rethrow;
    }
  }
}
