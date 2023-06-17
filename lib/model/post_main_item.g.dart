// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_main_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostMainItem _$PostMainItemFromJson(Map<String, dynamic> json) => PostMainItem(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$PostMainItemToJson(PostMainItem instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
