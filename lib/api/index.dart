import 'package:dio/dio.dart';
import 'package:material_app/api/common_interceptor.dart';

class HttpRequest {
  BaseOptions options;
  late Dio dioIns;

  HttpRequest(this.options) {
    dioIns = Dio(options);
    dioIns.interceptors.add(CommonInterceptor());
  }

  Future<dynamic> get(String url, Map<String, dynamic> query) async {
    Response<dynamic> res = await dioIns.get(url, queryParameters: query);
    return res.data?['data'];
  }

  Future<dynamic> post(String url, Object data) async {
    Response<dynamic> res = await dioIns.post(url,
        data: data,
        options: Options(headers: Map.from({'Accept': 'application/json'})));
    return res.data?['data'];
  }
}
