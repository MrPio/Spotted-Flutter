import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  Post();

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
