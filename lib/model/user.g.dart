// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String? ?? "Anonimo",
      surname: json['surname'] as String? ?? "",
      avatar: json['avatar'] as String?,
      regDateTimestamp: json['regDateTimestamp'] as int?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      postsUIDs: (json['postsUIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      following: (json['following'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cellNumber: json['cellNumber'] as String?,
      instagramNickname: json['instagramNickname'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'avatar': instance.avatar,
      'regDateTimestamp': instance.regDateTimestamp,
      'gender': _$GenderEnumMap[instance.gender]!,
      'tags': instance.tags,
      'postsUIDs': instance.postsUIDs,
      'comments': instance.comments,
      'following': instance.following,
      'cellNumber': instance.cellNumber,
      'instagramNickname': instance.instagramNickname,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
};
