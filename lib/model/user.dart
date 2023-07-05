import 'package:spotted_flutter/enums/gender.dart';
import 'package:spotted_flutter/enums/remote_images.dart';
import 'comment.dart';
import 'post.dart';
import 'tag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? name;
  final String? surname;
  final String avatar;
  final int regDateTimestamp;
  final Gender gender;
  final List<Tag> tags;
  final List<String> postsUIDs;
  final List<Comment> comments;
  final List<String> following;
  final String? cellNumber;
  final String? instagramNickname;

  @JsonKey(includeFromJson: false, includeToJson: false)
  String? uid;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<Post> posts;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<Post> followingPosts;

  User({
    this.name = "Anonimo",
    this.surname = "",
    String? avatar,
    int? regDateTimestamp,
    Gender? gender,
    List<Tag>? tags,
    List<String>? postsUIDs,
    List<Comment>? comments,
    List<String>? following,
    this.cellNumber,
    this.instagramNickname,
  })  : avatar = avatar ?? RemoteImages.anonymous.url,
        regDateTimestamp =
            regDateTimestamp ?? DateTime.now().millisecondsSinceEpoch,
        gender = gender ?? Gender.other,
        tags = tags ?? [],
        postsUIDs = postsUIDs ?? [],
        comments = comments ?? [],
        following = following ?? [],
        posts = [],
        followingPosts = [];

  get dateReg => DateTime.fromMillisecondsSinceEpoch(regDateTimestamp);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
