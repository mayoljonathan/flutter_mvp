import '../../data/repository/post_repository.dart';
import '../../dependency_injection.dart';
import 'post_contract.dart';

class PostListPresenter {
  PostListContract _view;
  PostRepository _repository;

  PostListPresenter(this._view) {
    _repository = locator<PostRepository>();
  }

  void getPosts() async {
    try {
      final posts = await _repository.getPosts();
      _view.onGetPostsSuccess(posts);
    } catch (e) {
      print('[PostPresenter - login]: $e');
      _view.onGetPostsError(e);
    }
  }
}
