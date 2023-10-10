import 'package:dio/dio.dart';

import './index.dart';

class TestApi {
  static final HttpRequest _api = HttpRequest(BaseOptions(
    baseUrl: 'http://192.118.118.168:3000',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
  TestApi();

  static Future<dynamic> generateUser(Map<String, dynamic> data) async {
    return await TestApi._api.post('/user', data);
  }
  static Future<dynamic> login(Map<String,dynamic> data) async {
    return await TestApi._api.post('/auth', data);
  }
}
