import 'package:cat_trivia/data/db/persistence_helper.dart';
import 'package:cat_trivia/data/repo/mapper/cats_fact_mapper.dart';
import 'package:cat_trivia/domain/models/cats_fact_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class CatsFactLocalRepo {
  final CatsFactMapper _catsFactMapper;
  final _factKey = 'fact';

  CatsFactLocalRepo(this._catsFactMapper);

  Future<void> saveCatsFact(CatsFactModel model) async {
    try {
      final newEntity = _catsFactMapper.fromModel(model);
      final entities = await Hive.box(HiveBoxes.catsFactBox).get(_factKey) ?? [];
      entities.add(newEntity);
      await Hive.box(HiveBoxes.catsFactBox).delete(_factKey);
      await Hive.box(HiveBoxes.catsFactBox).put(_factKey, entities);
    } catch (error) {
      rethrow;
    }
  }

  Future<List<CatsFactModel>> getSavedFacts() async {
    try {
      final facts = await Hive.box(HiveBoxes.catsFactBox).get(_factKey);
      final list = _catsFactMapper.fromEntity(facts);
      return list;
    } catch (error) {
      rethrow;
    }
  }
}
