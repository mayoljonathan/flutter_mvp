import 'package:flutter/material.dart';
import 'package:flutter_mvp/core/exceptions/exceptions.dart';
import 'package:flutter_mvp/features/post/post_list_presenter.dart';

import '../../data/model/post.dart';
import 'post_contract.dart';
import 'widgets/post_card.dart';

class PostListView extends StatefulWidget {
  @override
  _PostListViewState createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> implements PostListContract {
  PostListPresenter _presenter;

  List<Post> _posts = [];
  bool _isLoading = false;

  _PostListViewState() {
    _presenter = PostListPresenter(this);
  }

  @override
  void initState() {
    super.initState();

    _doGetPosts();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: _posts.length,
            itemBuilder: (_, int i) => PostCard(post: _posts[i]),
          );
  }

  void _doGetPosts() {
    setState(() => _isLoading = true);
    _presenter.getPosts();
  }

  @override
  void onGetPostsSuccess(List<Post> posts) {
    setState(() => _isLoading = false);
    _posts = posts;
  }

  @override
  void onGetPostsError(Failure failure) {
    // TODO: implement onGetPostsError
  }
}
