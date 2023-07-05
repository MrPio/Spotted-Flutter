import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag {
  Tag();

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
