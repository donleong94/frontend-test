// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_main_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentMainItem _$CommentMainItemFromJson(Map<String, dynamic> json) =>
    CommentMainItem(
      postId: json['postId'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$CommentMainItemToJson(CommentMainItem instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
