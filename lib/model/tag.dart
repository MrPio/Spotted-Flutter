import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag {
  final String name;
  final String icon;

  Tag({this.name = "", this.icon = ""});

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
