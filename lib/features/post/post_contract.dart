import '../../core/exceptions/exceptions.dart';
import '../../data/model/post.dart';

abstract class PostListContract {
  void onGetPostsSuccess(List<Post> posts);
  void onGetPostsError(Failure failure);
}

abstract class PostDetailContract {
  void onGetPostSuccess(Post post);
  void onGetPostError(Failure failure);
}

abstract class PostCreateContract {
  void onPostCreateSuccess(Post post);
  void onPostCreateError(Failure failure);
}

abstract class PostUpdateContract {
  void onPostUpdateSuccess(Post post);
  void onPostUpdateError(Failure failure);
}

abstract class PostDeleteContract {
  void onPostDeleteSuccess();
  void onPostDeleteError(Failure failure);
}
