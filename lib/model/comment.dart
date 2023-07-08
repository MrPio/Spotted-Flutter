import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {

  final String? authorUID;
  final String text;
  final int timestamp;

  DateTime get date => DateTime.fromMillisecondsSinceEpoch(timestamp);

  @JsonKey(includeFromJson: false, includeToJson: false)
  User? user;

  Comment({
    this.authorUID,
    this.text = "",
    this.timestamp=0,
    this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
