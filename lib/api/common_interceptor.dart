import 'package:dio/dio.dart';
import 'package:material_app/utils/storage.dart';

class CommonInterceptor extends Interceptor {
  CommonInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //  implement onRequest
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //  implement onResponse
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final code = err.response?.statusCode;
    if (code != null && code >= 400 && code < 500) {
      LocalStorage.remove('access_token');
    }
    //  implement onError
    handler.next(err);
  }
}
