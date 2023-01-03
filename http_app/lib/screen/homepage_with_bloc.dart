import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_app/bloc/posts/posts_bloc.dart';
import 'package:http_app/bloc/posts/posts_state.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomepageWithBloc extends StatefulWidget {
  const HomepageWithBloc({super.key});

  @override
  State<HomepageWithBloc> createState() => _HomepageWithBlocState();
}

class _HomepageWithBlocState extends State<HomepageWithBloc> {
  final postBloc = PostBloc();
  @override
  void initState() {
    super.initState();
    postBloc.fetchDataFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocConsumer(
        bloc: postBloc,
        listener: (context, state) {
          if (state is PostError) {
            Fluttertoast.showToast(msg: "An error occurred");
          }

          if (state is PostFetchSuccess) {
            Navigator.pushNamed(context, "/images");
          }
        },
        builder: (context, PostsState state) {
          print(state);

          if (state is PostLoading) {
            return CircularProgressIndicator();
          }
          if (state is PostError) {
            return Text(state.errorMessage);
          }

          if (state is PostFetchSuccess) {
            final data = state.data;

            return LazyLoadScrollView(
              onEndOfPage: () {
                print("on end of page called");
              },
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  // final post = postsList[index];
                  final post = data[index];

                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${index + 1}. ${post.title}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          SizedBox(height: 12),
                          Text(post.body),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }

          return Text("Unknown state");
        },
      )),
    );
  }
}

/// Bloc widgets: 

/// BlocBuilder: builds widgets listing to the states
/// BlocListener: can apply side effects like navigation 
///               or show popups.


/// BlocConsumer: Combined form of listener and builder