import 'package:bloc_learning/post_app/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post App')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is DataPostState) {
            return ListView.builder(
              itemCount: state.postModelList.length,
              itemBuilder: (context, index) {
                final post = state.postModelList[index];
                final title = post.title ?? 'No Title';
                final body = post.body ?? 'No Body';
                return ListTile(title: Text(title), subtitle: Text(body));
              },
            );
          } else if (state is ErrorPostState) {
            return const Center(child: Text('Error fetching posts'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
