import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pagination_flutter/data/models/post_model.dart';
import 'package:pagination_flutter/data/repos/post_repo.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostRepo _postRepository;
  int _page = 1;
  final int _limit = 10;
  bool _hasMore = true;

  PostsCubit(this._postRepository) : super(PostsInitial());

  void fetchPosts({bool isInitialLoad = false}) async {
    if (state is PostsLoading || !_hasMore) return;

    final List<Post> currentPosts =
        state is PostsLoaded ? (state as PostsLoaded).posts : [];

    emit(PostsLoading(currentPosts, isInitialLoad: isInitialLoad));

    try {
      final newPosts =
          await _postRepository.getPosts(page: _page, limit: _limit);
      _page++;
      _hasMore = newPosts.length == _limit;

      emit(PostsLoaded([...currentPosts, ...newPosts], hasMore: _hasMore));
    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }
}
