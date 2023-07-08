// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      authorUID: json['authorUID'] as String?,
      text: json['text'] as String? ?? "",
      timestamp: json['timestamp'] as int? ?? 0,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'authorUID': instance.authorUID,
      'text': instance.text,
      'timestamp': instance.timestamp,
    };
