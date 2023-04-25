import 'package:cat_trivia/data/db/entities/cats_fact_entity.dart';
import 'package:cat_trivia/data/network/dto/cats_fact_dto.dart';
import 'package:cat_trivia/data/network/response/cats_fact_response.dart';
import 'package:cat_trivia/domain/models/cats_fact_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class CatsFactMapper {
  CatsFactDto fromResponse(CatsFactResponse response) {
    return CatsFactDto(text: response.text ?? 'no next', createdAt: response.createdAt ?? 'no date');
  }

  CatsFactModel fromDto(CatsFactDto dto) {
    return CatsFactModel(text: dto.text, createdAt: dto.createdAt);
  }

  CatsFactEntity fromModel(CatsFactModel model) {
    return CatsFactEntity(text: model.text, createdAt: model.createdAt);
  }

  List<CatsFactModel> fromEntity(List<dynamic> entities) {
    return entities.map((entity) => CatsFactModel(text: entity.text, createdAt: entity.createdAt)).toList();
  }
}
