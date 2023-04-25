import 'package:cat_trivia/data/db/persistence_helper.dart';
import 'package:hive/hive.dart';

part 'cats_fact_entity.g.dart';

@HiveType(typeId: HiveTypeIds.catsFact)
class CatsFactEntity {
  @HiveField(0)
  final String text;
  @HiveField(1)
  final String createdAt;

  CatsFactEntity({required this.text, required this.createdAt});
}
