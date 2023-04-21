import 'package:cat_trivia/data/db/persistance_hepler.dart';
import 'package:hive/hive.dart';

part 'fact_entity.g.dart';

@HiveType(typeId: HiveTypeIds.fact)
class FactEntity {
  @HiveField(0)
  final String text;
  @HiveField(1)
  final String createdAt;

  FactEntity({required this.text, required this.createdAt});
}
