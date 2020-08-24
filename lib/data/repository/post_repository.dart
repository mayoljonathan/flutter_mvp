import 'dart:async';

import '../model/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
  Future<Post> getPost(String id);
  Future<Post> create(Post post);
  Future<Post> update(Post post);
  Future<bool> delete(Post post);
}
