import 'dart:convert';
import 'package:http/http.dart';
import '../Model/FirstModel.dart';
import 'api_client.dart';

class AiApi {
  ApiClient apiClient = ApiClient();
  Future<FirstModel> getMain() async {
    String trendingpath =
        'https://ai-text-to-image-generator-api.p.rapidapi.com/realistic';
    var body = {
      "inputs":"Find serenity in the tranquil elegance of a solitary sailboat drifting on a glassy lake at sunset"
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', body);

    return FirstModel.fromJson(jsonDecode(response.body));
  }
}