import 'package:json_annotation/json_annotation.dart';

part 'image_dto.g.dart';

@JsonSerializable()
class ImageDto {
  String? url;

  ImageDto({this.url});

  factory ImageDto.fromJson(Map<String, dynamic> json) => _$ImageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDtoToJson(this);
}
