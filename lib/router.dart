import 'package:material_app/pages/Home/Home.dart';
import 'package:material_app/pages/Login/Login.dart';
import 'package:material_app/pages/article_detail/article_detail.dart';
import 'package:material_app/pages/common_list/common_list.dart';
import 'package:material_app/pages/categories/categories.dart';
import 'package:material_app/pages/post_article/post_article.dart';
import 'package:material_app/pages/user_profile/user_profile.dart';
import 'pages/Register/Register.dart';
import 'pages/tags/Tags.dart';
import 'pages/category_detail/category_detail.dart';

final routeList = {
  '/tags': (context, {arguments}) => const Tags(),
  '/login': (context, {arguments}) => const Login(),
  '/home': (context, {arguments}) => const Home(),
  '/': (context, {arguments}) => const Home(),
  '/register': (context, {arguments}) => const Register(),
  '/user_profile': (context, {arguments}) => const UserProfile(),
  '/categories': (context, {arguments}) => const Categories(),
  '/post_article': (context, {arguments}) => const PostArticle(),
  '/category_detail': (context, {arguments}) => const CategoryDetail(),
  '/article_detail': (context, {arguments}) => ArticleDetail(
        arguments: arguments,
      ),
  '/common_list': (context, {arguments}) => const CommonList(),
};
