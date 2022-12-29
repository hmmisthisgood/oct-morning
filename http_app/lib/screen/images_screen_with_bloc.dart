import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_app/bloc/pixabay_image/image_cubit.dart';
import 'package:http_app/bloc/pixabay_image/image_start.dart';
import 'package:http_app/widget/instagram_post.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ImageScreenWithBloc extends StatefulWidget {
  const ImageScreenWithBloc({super.key});

  @override
  State<ImageScreenWithBloc> createState() => _ImageScreenWithBlocState();
}

class _ImageScreenWithBlocState extends State<ImageScreenWithBloc> {
  final ImageCubit imageCubit = ImageCubit();

  final listController = ScrollController();

  @override
  void initState() {
    super.initState();
    imageCubit.fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocConsumer(
        bloc: imageCubit,
        listener: (context, state) {
          if (state is ImageFetchMoreError) {
            Fluttertoast.showToast(msg: "An error while laoding more images");
          }
        },
        builder: (context, ImageState state) {
          print(state);

          if (state is ImageLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is ImageError) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is ImageFetchSuccess ||
              state is ImageFetchingMoreData ||
              state is ImageFetchMoreError) {
            return Column(
              children: [
                Expanded(
                  child: LazyLoadScrollView(
                    onEndOfPage: () {
                      imageCubit.loadMoreImages();
                    },
                    child: ListView.builder(
                        controller: listController,
                        itemCount: state.data?.length,
                        itemBuilder: (context, index) {
                          final oneImage = state.data![index];
                          return InstagramPost(post: oneImage);
                        }),
                  ),
                ),
                if (state is ImageFetchingMoreData) CircularProgressIndicator(),
                if (state is ImageFetchMoreError)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("An error occurred"),
                  )
              ],
            );
          }

          return Text("$state");
        },
      ),
    );
  }
}
