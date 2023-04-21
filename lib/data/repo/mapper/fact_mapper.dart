import 'package:cat_trivia/data/db/entities/fact_entity.dart';
import 'package:cat_trivia/data/network/dto/fact_dto.dart';
import 'package:cat_trivia/data/network/response/random_fact_response.dart';
import 'package:cat_trivia/domain/models/fact_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class FactMapper {
  FactDto fromResponse(RandomFactResponse response) {
    return FactDto(text: response.text ?? 'no next', createdAt: response.createdAt ?? 'no date');
  }

  FactModel fromDto(FactDto dto) {
    return FactModel(text: dto.text, createdAt: dto.createdAt);
  }

  FactEntity fromModel(FactModel model) {
    return FactEntity(text: model.text, createdAt: model.createdAt);
  }

  List<FactModel> fromEntity(List<dynamic> entities) {
    return entities.map((entity) => FactModel(text: entity.text, createdAt: entity.createdAt)).toList();
  }
}
