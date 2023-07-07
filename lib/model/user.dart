import 'package:spotted_flutter/enums/gender.dart';
import 'package:spotted_flutter/enums/remote_images.dart';
import 'package:spotted_flutter/enums/tags.dart';
import 'package:spotted_flutter/interfaces/json_serializable.dart';
import 'comment.dart';
import 'post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User implements JSONSerializable{
  final String? name;
  final String? surname;
  final String avatar;
  final int regDateTimestamp;
  final Gender gender;
  final List<Tags> tags;
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
    List<Tags>? tags,
    List<String>? postsUIDs,
    List<Comment>? comments,
    List<String>? following,
    this.cellNumber,
    this.instagramNickname,
  })  : avatar = avatar ?? RemoteImages.ANONYMOUS.url,
        regDateTimestamp =
            regDateTimestamp ?? DateTime.now().millisecondsSinceEpoch,
        gender = gender ?? Gender.OTHER,
        tags = tags ?? [],
        postsUIDs = postsUIDs ?? [],
        comments = comments ?? [],
        following = following ?? [],
        posts = [],
        followingPosts = [];

  get dateReg => DateTime.fromMillisecondsSinceEpoch(regDateTimestamp);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJSON() => _$UserToJson(this);
}
