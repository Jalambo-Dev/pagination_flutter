import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_flutter/cubit/posts_cubit.dart';
import 'package:pagination_flutter/data/repos/post_repo.dart';
import 'package:pagination_flutter/data/services/post_service.dart';
import 'package:pagination_flutter/ui/screens/posts_screen.dart';

void main(List<String> args) {
  runApp(const PaginationApp());

  // Making the navigation bar and status bar transparent
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));
}

class PaginationApp extends StatelessWidget {
  const PaginationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => PostsCubit(PostRepo(PostService())),
        child: const PostScreen(),
      ),
    );
  }
}
