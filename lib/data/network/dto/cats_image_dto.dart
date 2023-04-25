import 'package:json_annotation/json_annotation.dart';

part 'cats_image_dto.g.dart';

@JsonSerializable()
class CatsImageDto {
  String? url;

  CatsImageDto({this.url});

  factory CatsImageDto.fromJson(Map<String, dynamic> json) => _$CatsImageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CatsImageDtoToJson(this);
}
