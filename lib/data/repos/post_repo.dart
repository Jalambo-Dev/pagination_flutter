import 'dart:developer';

import 'package:pagination_flutter/data/models/post_model.dart';
import 'package:pagination_flutter/data/services/post_service.dart';


class PostRepo {
  final PostService postService;

  // Constructor receives an instance of PostService
  PostRepo(this.postService);

  // Get posts with pagination through the PostService
  Future<List<Post>> getPosts({required int page, required int limit}) async {
    final posts = await postService.fetchPosts(page: page, limit: limit);
    if (posts.isNotEmpty) {
      return posts.map((json) => Post.fromJson(json)).toList();
    } else {
      log("No posts found or invalid response");
      return [];
    }
  }
}

