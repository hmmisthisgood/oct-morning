import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_app/bloc/pixabay_image/image_start.dart';
import 'package:http_app/utils/strings.dart';

import '../../model/pixabay_image.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());

  int currentPage = 1;
  List<PixabayImage> allImages = [];

  fetchImages() async {
    final dio = Dio(BaseOptions());

    try {
      emit(ImageLoading());

      final response = await dio.get(
        pixabayUrl,
        queryParameters: {
          "key": apiKey,
          "page": 1,
          "per_page": 5,
          "q": "cars",
        },
      );

      final Map body = response.data;
      // json.decode() not needed

      final List hits = body['hits'];
      final imagesList =
          hits.map((item) => PixabayImage.fromJson(item)).toList();
      allImages = imagesList;
      print("success");
      emit(ImageFetchSuccess(data: imagesList));
    } catch (e, s) {
      print(e);
      print(s);
      emit(ImageError(errorMessage: e.toString()));
    }
  }

  loadMoreImages() async {
    currentPage = currentPage + 1;

    print("loading more data");
    final dio = Dio(BaseOptions());

    try {
      emit(ImageFetchingMoreData(data: allImages));

      final response = await dio.get(
        pixabayUrl,
        queryParameters: {
          "key": apiKey,
          "page": currentPage, //5
          "per_page": 5,
          "q": "cars",
        },
      );

      final Map body = response.data;
      // json.decode() not needed

      final List hits = body['hits'];
      final loadMoreData =
          hits.map((item) => PixabayImage.fromJson(item)).toList();
      allImages.addAll(loadMoreData);

      emit(ImageFetchSuccess(data: allImages));
    } catch (e, s) {
      print(e);
      print(s);
      emit(ImageFetchMoreError(data: allImages, errorMessage: e.toString()));
    }
  }
}
