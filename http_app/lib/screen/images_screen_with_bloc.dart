import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_app/bloc/pixabay_image/image_cubit.dart';
import 'package:http_app/bloc/pixabay_image/image_start.dart';
import 'package:http_app/widget/images_list.dart';

class ImageScreenWithBloc extends StatefulWidget {
  const ImageScreenWithBloc({super.key});

  @override
  State<ImageScreenWithBloc> createState() => _ImageScreenWithBlocState();
}

class _ImageScreenWithBlocState extends State<ImageScreenWithBloc> {
  // final ImageCubit imageCubit = ImageCubit();

  // final ImageCubit imageCubit1 = ImageCubit();
  // final ImageCubit imageCubit2 = ImageCubit();

  final listController = ScrollController();
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ImageCubit>(context).fetchImages();

    //same line ass above
    // context.read<ImageCubit>().fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocConsumer<ImageCubit, ImageState>(
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
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          // listController.jumpTo(0);
                          listController.animateTo(0,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeIn);
                        },
                        child: Text("SCroll to top")),
                    TextButton(
                        onPressed: () {
                          listController.jumpTo(1000);
                        },
                        child: Text("SCroll to Bottom")),
                  ],
                ),

                ///
                Expanded(child: ImagesListView(data: state.data!)),
                //

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

/// BlocProvider
