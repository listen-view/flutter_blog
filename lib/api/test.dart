import 'package:dio/dio.dart';
import 'package:material_app/model/article_detail.dart';
import 'package:material_app/model/tag.dart';
import 'package:material_app/utils/storage.dart';

import './index.dart';

class TestApi {
  static final HttpRequest _api = HttpRequest(BaseOptions(
    baseUrl: 'http://192.118.118.168:3000',
    connectTimeout: const Duration(seconds: 50),
    receiveTimeout: const Duration(seconds: 50),
  ));

  TestApi();

  static Future<String> _getToken() async {
    var token = await LocalStorage.get('access_token');
    return token ?? '';
  }

  static Future<dynamic> get(String url, dynamic params) async {
    String token = await _getToken();
    TestApi._api.options.headers['Authorization'] = 'Bearer $token';
    return TestApi._api.get(url, params);
  }

  static Future<dynamic> post(String url, dynamic data) async {
    String token = await _getToken();
    TestApi._api.options.headers['Authorization'] = 'Bearer $token';
    return _api.post(url, data);
  }

  static Future<dynamic> generateUser(Map<String, dynamic> data) async {
    return await post('/user', data);
  }

  static Future<dynamic> login(Map<String, dynamic> data) async {
    return await post('/auth', data);
  }

  static Future<dynamic> postArticle(Map<String, dynamic> data) async {
    return await post('/posts', data);
  }

  static Future<List<ArticleModel>> getArticleList(
      Map<String, dynamic> data) async {
    var list = await get('/posts', data);
    return (list as Iterable<dynamic>).map((e) {
      return ArticleModel.fromJson(e);
    }).toList();
  }

  static Future<ArticleModel> getArticleDetail(
      Map<String, dynamic> data) async {
    return ArticleModel.fromJson(await get('/posts/detail', data));
  }

  static Future<List<TagModel>> getCategories(Map<String, dynamic> data) async {
    var list = await get('/tag', data);
    return (list as Iterable).map((e) => TagModel.fromJson(e)).toList();
  }

  static Future<List<ArticleModel>> getHotArticle(
      Map<String, dynamic> data) async {
    var list = await get('/posts/hot', data);
    return (list as Iterable).map((e) => ArticleModel.fromJson(e)).toList();
  }

  static Future<dynamic> increaseRead(Map<String, dynamic> data) async {
    return await get('/posts/view', data);
  }
}
