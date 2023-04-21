import 'package:cat_trivia/data/network/dto/image_dto.dart';
import 'package:cat_trivia/domain/models/image_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ImageMapper{
  ImageModel fromDto(ImageDto dto){
    return ImageModel(url: dto.url ?? 'no url');
  }
}