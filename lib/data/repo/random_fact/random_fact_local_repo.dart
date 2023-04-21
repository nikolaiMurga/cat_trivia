import 'package:cat_trivia/data/db/entities/fact_entity.dart';
import 'package:cat_trivia/data/db/persistance_hepler.dart';
import 'package:cat_trivia/data/repo/mapper/fact_mapper.dart';
import 'package:cat_trivia/domain/models/fact_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class RandomFactLocalRepo {
  final FactMapper _factMapper;
  final _factKey = 'fact';

  RandomFactLocalRepo(this._factMapper);

  Future<void> addFact(FactModel model) async {
    try{
      final newEntity = _factMapper.fromModel(model);
      final entities = await Hive.box(HiveBoxes.factBox).get(_factKey) ?? <FactEntity>[];
      entities.add(newEntity);
      await Hive.box(HiveBoxes.factBox).delete(_factKey);
      await Hive.box(HiveBoxes.factBox).put(_factKey, entities);
    }catch(error){
      rethrow;
    }
  }

  Future<List<FactModel>> getFacts() async {
    try{
      final facts = await Hive.box(HiveBoxes.factBox).get(_factKey) as List<FactEntity>;
      final list = _factMapper.fromEntity(facts);
      return list;
    } catch (error){
      rethrow;
    }
  }
}
