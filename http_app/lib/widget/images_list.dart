import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_app/bloc/pixabay_image/image_cubit.dart';
import 'package:http_app/model/pixabay_image.dart';
import 'package:http_app/widget/instagram_post.dart';

class ImagesListView extends StatefulWidget {
  const ImagesListView({super.key, required this.data, this.hashtag});
  final List<PixabayImage> data;
  final String? hashtag;
  @override
  State<ImagesListView> createState() => _ImagesListViewState();
}

class _ImagesListViewState extends State<ImagesListView> {
  final ScrollController listController = ScrollController();

  @override
  void initState() {
    super.initState();

    listController.addListener(listener);
  }

  void listener() {
    final ScrollPosition position = listController.position;
    final double pixels = position.pixels;

    final double max = position.maxScrollExtent;
    final double min = position.minScrollExtent; //0
    final bool atEdge = position.atEdge;

    // print("Min:$min");
    print("current position: $pixels");
    // print("Max: $max");

    /// start
    if (pixels <= min && atEdge) {
      print("I am at start of scroll");
    }

    // dectect scroll end
    if (pixels >= max && atEdge) {
      print("at scroll end");

      BlocProvider.of<ImageCubit>(context).loadMoreImages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: listController,
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        final oneImage = widget.data[index];
        return InstagramPost(
          post: oneImage,
          hashtag: widget.hashtag,
        );
      },
    );
  }
}
