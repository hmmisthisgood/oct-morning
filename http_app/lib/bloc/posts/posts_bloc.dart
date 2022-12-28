import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_app/bloc/posts/posts_state.dart';
import 'package:http/http.dart' as http;
import 'package:http_app/model/post.dart';

class PostBloc extends Cubit<PostsState> {
  PostBloc() : super(PostLoading());

  fetchDataFromServer() async {
    final url = "https://jsonplaceholder.typicode.com/posts";
    // final url = "2.0";

    final uri = Uri.parse(url);

    try {
      emit(PostLoading());

      final response = await http.get(uri);

      final List decodedList = json.decode(response.body); // List<Map>
      final postData =
          decodedList.map((e) => Post.convertJsonToPost(e)).toList();

      emit(PostFetchSuccess(data: postData));
    } catch (e, stackTace) {
      print(e);
      print(stackTace);

      emit(PostError(errorMessage: e.toString()));
    }
    print("This is also executed");
  }

  postDataToServer() async {
    final uri = "https://jsonplaceholder.typicode.com/posts/121231";

    try {
      http.post(Uri.parse(uri), body: {
        "email": "test@test.com",
        "password": "password"
      }, headers: {
        "Content-Type": "application/json",
        // "Authorization": "Bearer .....",
      });
    } catch (e) {}
  }
}


/// Cubit 
/// emit
/// Bloc widgets: 

/// BlocBuilder
/// BlocListener
/// BlocConsumer