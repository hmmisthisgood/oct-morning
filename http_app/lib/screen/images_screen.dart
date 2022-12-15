import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http_app/model/pixabay_image.dart';
import 'package:http_app/utils/strings.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  List images = [];
  List<PixabayImage> pixabayImages = [];
  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  fetchImages() async {
    final dio = Dio(BaseOptions());

    try {
      final response = await dio.get(
        pixabayUrl,
        queryParameters: {
          "key": apiKey,
          "page": 1,
          "per_page": 100,
          "q": "cars"
        },
      );

      final Map body = response.data;
      // json.decode() not needed

      final List hits = body['hits'];
      images = hits;
      print(hits.length);
      pixabayImages = hits.map((item) => PixabayImage.fromJson(item)).toList();

      setState(() {});
      print(body);

      print(response.statusCode);
    } on DioError catch (e, s) {
      print(e);
      print(s);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: pixabayImages.length,
          itemBuilder: (context, index) {
            final oneImage = pixabayImages[index];
            return Image.network(oneImage.largeImageUrl);
          }),
    );
  }
}
