import 'package:json_annotation/json_annotation.dart';
import 'package:spotted_flutter/enums/gender.dart';
import 'package:spotted_flutter/enums/locations.dart';
import 'package:spotted_flutter/extension/function/date_time_extensions.dart';
import 'comment.dart';
import 'tag.dart';
import 'user.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
    final String? authorUID;
  final Locations? location;
  final Gender gender;
  final int timestamp;
  final String description;
  final List<Tag> tags;
  final List<String> followers;
  final List<Comment> comments;
  final double? latitude;
  final double? longitude;
  final bool anonymous;
  final bool spotted;

  @JsonKey(includeFromJson: false, includeToJson: false)
  String? uid;

  @JsonKey(includeFromJson: false, includeToJson: false)
  User? author;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<User?> lastFollowers;

  Post({
    this.authorUID,
    this.location,
    Gender? gender,
    this.timestamp = 0,
    this.description = "",
    List<Tag>? tags,
    List<String>? followers,
    List<Comment>? comments,
    this.latitude,
    this.longitude,
    this.anonymous = false,
    this.spotted = false,
    this.uid,
    this.author,
    List<User?>? lastFollowers,
  })  : gender=gender??Gender.FEMALE,
        tags = tags ?? [],
        followers = followers ?? [],
        comments = comments ?? [],
        lastFollowers = lastFollowers ?? [];

  DateTime get date => DateTime.fromMillisecondsSinceEpoch(timestamp);

  int calculateRelevance(List<Tag> tags) {
    if (tags.isEmpty) return 0;
    return tags.where((tag) => this.tags.contains(tag)).length * 100 ~/ tags.length;
  }

  List<String> validate() {
    final errors = <String>[];
    if (location == null) {
      errors.add("Il luogo del post deve essere specificato.");
    }
    if (description.length < 6 || description.length > 1000) {
      errors.add("La descrizione deve essere presente e non più lunga di 1000 caratteri.");
    }
    if (tags.length < 3) {
      errors.add("Specifica almeno 3 tags");
    }
    return errors;
  }

    factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
