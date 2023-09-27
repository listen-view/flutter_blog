import 'package:dio/dio.dart';

import './index.dart';

class TestApi {
  static final HttpRequest _api = HttpRequest(BaseOptions(
    baseUrl: 'http://127.0.0.1:3000',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
  TestApi();

  static Future<dynamic> generateUser(Map<String, dynamic> data) async {
    return await TestApi._api.post('/user', data);
  }
}
