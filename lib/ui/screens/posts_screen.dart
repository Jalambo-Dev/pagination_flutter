import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_flutter/data/models/post_model.dart';
import 'package:pagination_flutter/ui/widgets/post_card_widget.dart';
import '../../cubit/posts_cubit.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    // Initialize the ScrollController
    _scrollController = ScrollController();
    // Add a listener to detect when we are near the bottom of the list
    _scrollController.addListener(_onScroll);
    // Load the initial set of posts
    BlocProvider.of<PostsCubit>(context).fetchPosts(isInitialLoad: true);
  }

  @override
  void dispose() {
    // Dispose the scroll controller when the widget is disposed
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        // Fetch the next page of posts when scrolled near the bottom
        BlocProvider.of<PostsCubit>(context).fetchPosts();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Posts Pagination',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _buildBlocBuilderPosts(),
    );
  }

  Widget _buildBlocBuilderPosts() {
    return BlocBuilder<PostsCubit, PostsState>(builder: (context, state) {
      if (state is PostsLoading && state.isInitialLoad) {
        // Show loading indicator for the first fetch
        return const Center(child: CircularProgressIndicator());
      }

      // Initialize the posts list and loading flag
      List<Post> posts = [];
      bool isLoading = false;

      if (state is PostsLoading) {
        posts = (state).oldPosts;
        isLoading = true;
      } else if (state is PostsLoaded) {
        posts = state.posts;
      } else if (state is PostsError) {
        // Handle error state by showing an error message
        return Center(
          child: Text('Error: ${state.message}'),
        );
      }

      // Call the _buildPostsList and pass posts and loading status
      return _buildPostsList(posts, isLoading);
    });
  }

  Widget _buildPostsList(List<Post> posts, bool isLoading) {
    return ListView.builder(
      controller: _scrollController, // Attach the scroll controller
      itemCount: posts.length +
          (isLoading ? 1 : 0), // Add 1 extra item for the loading indicator
      itemBuilder: (context, index) {
        if (index < posts.length) {
          return PostCardWidget(
            post: posts[index],
          );
        } else {
          // If we are at the end, show the loading indicator
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
