import 'package:cat_trivia/data/network/dto/cats_image_dto.dart';
import 'package:cat_trivia/domain/models/cats_image_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class CatsImageMapper{
  CatsImageModel fromDto(CatsImageDto dto){
    return CatsImageModel(url: dto.url ?? 'no url');
  }
}