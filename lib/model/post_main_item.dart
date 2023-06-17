import 'package:json_annotation/json_annotation.dart';

part 'post_main_item.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class PostMainItem {
  @JsonKey(name: 'userId')
  final int? userId;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'body')
  final String? body;

  PostMainItem({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostMainItem.fromJson(Map<String, dynamic> json) => _$PostMainItemFromJson(json);

  Map<String, dynamic> toJson() => _$PostMainItemToJson(this);
}
