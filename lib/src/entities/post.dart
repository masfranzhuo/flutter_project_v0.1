import 'package:flutter_project/core/utils/formater.dart';
import 'package:flutter_project/src/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  @JsonSerializable(
    checked: true,
    anyMap: true,
    includeIfNull: false,
    explicitToJson: true,
  )
  factory Post({
    required String id,
    required String text,
    required String image,
    @Default(0) int likes,
    List<String>? tags,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
        required DateTime? publishDate,
    User? owner,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
