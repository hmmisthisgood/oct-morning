import 'package:http_app/model/pixabay_image.dart';

abstract class ImageState {
  List<PixabayImage>? data;
  ImageState({this.data});
}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageError extends ImageState {
  final String errorMessage;
  ImageError({required this.errorMessage});
}

class ImageFetchSuccess extends ImageState {
  final List<PixabayImage> data;
  ImageFetchSuccess({required this.data}) : super(data: data);
}

class ImageFetchingMoreData extends ImageState {
  final List<PixabayImage> data;
  ImageFetchingMoreData({required this.data}) : super(data: data);
}

class ImageFetchMoreError extends ImageState {
  final List<PixabayImage> data;
  final String errorMessage;

  ImageFetchMoreError({required this.data, required this.errorMessage})
      : super(data: data);
}

class ImageRefreshing extends ImageState {}

class ImageRefreshError extends ImageState {}
