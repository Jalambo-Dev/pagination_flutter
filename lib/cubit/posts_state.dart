part of 'posts_cubit.dart';

@immutable
sealed class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {
  final List<Post> oldPosts;
  final bool isInitialLoad;

  PostsLoading(this.oldPosts, {this.isInitialLoad = false});
}

class PostsLoaded extends PostsState {
  final List<Post> posts;
  final bool hasMore;

  PostsLoaded(this.posts, {this.hasMore = true});
}

class PostsError extends PostsState {
  final String message;

  PostsError(this.message);
}
