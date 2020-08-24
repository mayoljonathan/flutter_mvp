// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    postId: json['postId'] as String,
  )
    ..id = json['_id'] as String
    ..body = json['body'] as String
    ..author = json['author'] == null
        ? null
        : User.fromJson(json['author'] as Map<String, dynamic>)
    ..likes = (json['likes'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..comments = (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..createdAt = json['createdAt'] as String
    ..updatedAt = json['updatedAt'] as String;
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      '_id': instance.id,
      'body': instance.body,
      'author': instance.author?.toJson(),
      'likes': instance.likes?.map((e) => e?.toJson())?.toList(),
      'comments': instance.comments?.map((e) => e?.toJson())?.toList(),
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'postId': instance.postId,
    };
