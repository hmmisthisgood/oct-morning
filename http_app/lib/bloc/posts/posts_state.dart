import 'package:http_app/model/post.dart';

abstract class PostsState {}

class PostLoading extends PostsState {}

class PostError extends PostsState {
  final String errorMessage;

  PostError({required this.errorMessage});
}

class PostFetchSuccess extends PostsState {
  final List<Post> data;
  PostFetchSuccess({required this.data});
}
