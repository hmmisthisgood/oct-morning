import 'package:http_app/utils/strings.dart';

class Env {
  final String baseUrl;
  final List adIds;
  final String apiKey;
  Env({required this.baseUrl, required this.adIds, required this.apiKey});

  static Env devEnv = Env(baseUrl: devUrl, adIds: [], apiKey: "apiKey");
  static Env productionEnv =
      Env(baseUrl: pixabayUrl, adIds: [], apiKey: "apiKey");
}
