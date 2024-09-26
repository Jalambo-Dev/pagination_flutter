import 'package:flutter/material.dart';
import 'package:pagination_flutter/data/models/post_model.dart';

class PostCardWidget extends StatelessWidget {
  final Post post;
  const PostCardWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(
          post.id.toString(),
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        title: Text(
          post.title,
          style: const TextStyle(
            fontSize: 18,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          post.body,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
