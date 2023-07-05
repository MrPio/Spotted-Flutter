import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {

  final String? authorUID;
  final String text;
  final DateTime date;

  @JsonKey(includeFromJson: false, includeToJson: false)
  User? user;

  Comment({
    this.authorUID,
    this.text = "",
    DateTime? date,
    this.user,
  }) : date = date ?? DateTime.now();

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
