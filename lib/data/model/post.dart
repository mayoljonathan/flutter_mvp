import 'package:json_annotation/json_annotation.dart';

import 'comment.dart';
import 'user.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
class Post {
  @JsonKey(name: '_id')
  String id;
  String body;
  User author;
  List<User> likes;
  List<Comment> comments;
  String createdAt;
  String updatedAt;

  Post({
    this.id,
    this.body,
    this.author,
    this.likes,
    this.comments,
    this.createdAt,
    this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  bool get hasLikes => likes != null ? likes.length > 0 : false;
  String get likesCountAsString => likes.length > 1 ? '${likes.length} likes' : '${likes.length} like';

  bool get hasComments => comments != null ? comments.length > 0 : false;
  String get commentsCountAsString =>
      comments.length > 1 ? '${comments.length} comments' : '${comments.length} comment';
}
