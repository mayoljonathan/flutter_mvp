import 'dart:convert';
import 'dart:io';

import '../../core/exceptions/exceptions.dart';
import '../model/post.dart';
import '../repository/api_service.dart';
import '../repository/post_repository.dart';

class PostRemoteDataSource implements PostRepository {
  final ApiService _apiService;

  PostRemoteDataSource(this._apiService);

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
  Future<List<Post>> getPosts() async {
    const String url = '/api/v1/posts';

    final response = await _apiService.get(url);

    if (response.statusCode != 200) {
      if (response.statusCode >= 500) throw ServerException();

      throw HttpException('An error has occured in getting posts. [Code: ${response.statusCode}]');
    } else {
      final List data = jsonDecode(response.body);
      return List<Post>.from(data.map((post) => Post.fromJson(post)));
    }
  }

  @override
  Future<Post> update(Post post) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
