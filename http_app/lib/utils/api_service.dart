import 'package:dio/dio.dart';
import 'package:http_app/model/pixabay_image.dart';
import 'package:http_app/utils/strings.dart';

class ApiService {
  static Future<List<PixabayImage>> fetchImages() async {
    final dio = Dio(BaseOptions());

    try {
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
      print(hits.length);
      print(response.statusCode);

      return hits.map((item) => PixabayImage.fromJson(item)).toList();
    } on DioError catch (e, s) {
      print(e);
      print(s);
      throw e;
    } catch (e, s) {
      print(e);
      print(s);
      throw e;
    }
  }
}
