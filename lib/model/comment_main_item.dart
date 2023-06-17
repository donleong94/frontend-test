import 'package:json_annotation/json_annotation.dart';

part 'comment_main_item.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CommentMainItem {
  @JsonKey(name: 'postId')
  final int? postId;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'body')
  final String? body;

  CommentMainItem({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory CommentMainItem.fromJson(Map<String, dynamic> json) => _$CommentMainItemFromJson(json);

  Map<String, dynamic> toJson() => _$CommentMainItemToJson(this);
}
