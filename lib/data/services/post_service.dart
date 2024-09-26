import 'dart:developer';
import 'package:dio/dio.dart';

// Service to fetch posts
class PostService {
  late Dio _dio;
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/';

  // Constructor initializes Dio with base options
  PostService() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 120),
      connectTimeout: const Duration(seconds: 120),
    );
    _dio = Dio(baseOptions);
  }

  // Fetch post data with pagination
  Future<List<dynamic>> fetchPosts(
      {required int page, required int limit}) async {
    try {
      Response response = await _dio.get('posts', queryParameters: {
        '_limit': limit,
        '_page': page,
      });

      // Log response for debugging
      log("Response data for page $page: ${response.data}");

      if (response.data != null && response.data is List) {
        return response.data;
      } else {
        log("API response is null or not a valid list");
        return [];
      }
    } catch (e) {
      log("Error fetching posts: ${e.toString()}");
      return [];
    }
  }
}
