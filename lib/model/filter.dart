import 'package:json_annotation/json_annotation.dart';

part 'filter.g.dart';

@JsonSerializable()
class Filter {
  Filter();

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}
