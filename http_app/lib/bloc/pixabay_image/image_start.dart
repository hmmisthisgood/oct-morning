import 'package:equatable/equatable.dart';
import 'package:http_app/model/pixabay_image.dart';

abstract class ImageState extends Equatable {
  List<PixabayImage>? data;
  ImageState({this.data});
}

class ImageInitial extends ImageState {
  @override
  List<Object?> get props => [];
}

class ImageLoading extends ImageState {
  final String loadingMessage;
  ImageLoading({this.loadingMessage = ""});
  @override
  List<Object?> get props => [loadingMessage];
}

class ImageError extends ImageState {
  final String errorMessage;
  ImageError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class ImageFetchSuccess extends ImageState {
  final List<PixabayImage> data;
  ImageFetchSuccess({required this.data}) : super(data: data);
  @override
  List<Object?> get props => [...data];
}

class ImageFetchingMoreData extends ImageState {
  final List<PixabayImage> data;
  ImageFetchingMoreData({required this.data}) : super(data: data);
  @override
  List<Object?> get props => [...data];
}

class ImageFetchMoreError extends ImageState {
  final List<PixabayImage> data;
  final String errorMessage;

  ImageFetchMoreError({required this.data, required this.errorMessage})
      : super(data: data);
  @override
  List<Object?> get props => [errorMessage, ...data];
}

class ImageRefreshing extends ImageState {
  final List<PixabayImage> data;
  ImageRefreshing({required this.data});
  @override
  List<Object?> get props => [];
}

class ImageRefreshError extends ImageState {
  final List<PixabayImage> data;
  ImageRefreshError({required this.data});
  @override
  List<Object?> get props => [];
}

class DummyState extends ImageState {
  @override
  List<Object?> get props => [];
}
