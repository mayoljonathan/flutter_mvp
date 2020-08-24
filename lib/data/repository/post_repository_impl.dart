import 'package:flutter_mvp/core/exceptions/exceptions.dart';
import 'package:meta/meta.dart';

import '../datasource/post_remote_datasource.dart';
import '../model/post.dart';
import 'post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<Post> create(Post post) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(Post post) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Post> getPost(String id) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPosts() {
    try {
      return remoteDataSource.getPosts();
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<Post> update(Post post) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
