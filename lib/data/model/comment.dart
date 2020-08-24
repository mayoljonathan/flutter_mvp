import 'package:json_annotation/json_annotation.dart';

import 'post.dart';
import 'user.dart';

part 'comment.g.dart';

@JsonSerializable(explicitToJson: true)
class Comment extends Post {
  String postId;

  Comment({
    this.postId,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
