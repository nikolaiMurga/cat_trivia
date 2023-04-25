import 'package:cat_trivia/data/network/dto/cats_image_dto.dart';
import 'package:cat_trivia/domain/models/image_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class CatsImageMapper{
  ImageModel fromDto(CatsImageDto dto){
    return ImageModel(url: dto.url ?? 'no url');
  }
}