import 'dart:convert';
import 'package:http/http.dart';
import '../Model/FirstModel.dart';
import 'api_client.dart';

class AiApi {
  ApiClient apiClient = ApiClient();
  Future<FirstModel> getMain(String id) async {
    String trendingpath =
        'https://ai-text-to-image-generator-api.p.rapidapi.com/realistic';
    var body = {
      "inputs":id
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return FirstModel.fromJson(jsonDecode(response.body));
  }
}