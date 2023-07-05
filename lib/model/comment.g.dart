// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      authorUID: json['authorUID'] as String?,
      text: json['text'] as String? ?? "",
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'authorUID': instance.authorUID,
      'text': instance.text,
      'date': instance.date.toIso8601String(),
    };
