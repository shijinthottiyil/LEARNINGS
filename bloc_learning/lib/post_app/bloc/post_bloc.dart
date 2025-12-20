import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_learning/post_app/model/post_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<FetchPostEvent>((event, emit) async {
      try {
        List<PostModel> postList = [];
        await Future.delayed(const Duration(seconds: 2));
        final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        );
        final json = jsonDecode(response.body);
        List responseList = json as List;
        // print(responseList);
        for (var json in responseList) {
          final post = PostModel.fromJson(json);
          postList.add(post);
        }
        emit(DataPostState(postModelList: postList));
      } catch (error) {
        print(error);
        emit(ErrorPostState());
      }
    });
  }
}
