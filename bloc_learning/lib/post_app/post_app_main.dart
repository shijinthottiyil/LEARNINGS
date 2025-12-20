import 'package:bloc_learning/post_app/bloc/post_bloc.dart';
import 'package:bloc_learning/post_app/view/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(PostApp());
}

class PostApp extends StatelessWidget {
  const PostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => PostBloc())],
        child: PostView(),
      ),
    );
  }
}
