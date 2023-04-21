import 'package:cat_trivia/data/repo/mapper/fact_mapper.dart';
import 'package:cat_trivia/data/repo/mapper/image_mapper.dart';
import 'package:cat_trivia/data/repo/random_fact/random_fact_local_repo.dart';
import 'package:cat_trivia/data/repo/random_fact/random_fact_network_repo.dart';
import 'package:cat_trivia/domain/models/fact_model.dart';
import 'package:cat_trivia/domain/models/image_model.dart';
import 'package:cat_trivia/domain/repo/random_fact_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RandomFactRepo)
class RandomFactRepoImpl extends RandomFactRepo {
  final RandomFactNetworkRepo _randomFactNetworkRepo;
  final RandomFactLocalRepo _randomFactLocalRepo;
  final FactMapper _factMapper;
  final ImageMapper _imageMapper;

  RandomFactRepoImpl(this._randomFactNetworkRepo, this._randomFactLocalRepo, this._factMapper, this._imageMapper);

  @override
  Future<FactModel> fetchRandomFact() async {
    try{
      final dto = await _randomFactNetworkRepo.fetchRandomCatsFact();
      final model = _factMapper.fromDto(dto);
      await _randomFactLocalRepo.addFact(model);
      return model;
    }catch(error){
      rethrow;
    }
  }

  @override
  Future<ImageModel> fetchCatImage() async {
    try{
      final dto = await _randomFactNetworkRepo.fetchCatImage();
      final model = _imageMapper.fromDto(dto);
      return model;
    }catch(error){
      rethrow;
    }
  }

  @override
  Future<List<FactModel>> getFacts() async {
    try{
      final list = await _randomFactLocalRepo.getFacts();
      return list;
    }catch(error){
      rethrow;
    }
  }
}
