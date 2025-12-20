part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState({required this.postModelList});
  final List<PostModel> postModelList;
  @override
  List<Object> get props => [postModelList];
}

final class PostInitial extends PostState {
  const PostInitial() : super(postModelList: const []);
}

final class DataPostState extends PostState {
  const DataPostState({required super.postModelList});
}

final class ErrorPostState extends PostState {
  const ErrorPostState() : super(postModelList: const []);
}
