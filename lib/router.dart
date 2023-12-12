import 'dart:html';

import 'package:flutter/material.dart';
import 'package:material_app/pages/Home/Home.dart';
import 'package:material_app/pages/Login/Login.dart';
import 'package:material_app/pages/article_detail/article_detail.dart';
import 'package:material_app/pages/common_list/common_list.dart';
import 'package:material_app/pages/categories/categories.dart';
import 'package:material_app/pages/post_article/post_article.dart';
import 'package:material_app/pages/user_profile/user_profile.dart';
import 'package:material_app/utils/storage.dart';
import 'pages/Register/Register.dart';
import 'pages/tags/Tags.dart';
import 'pages/category_detail/category_detail.dart';

final routeList = {
  '/tags': (context) => const Tags(),
  '/login': (context) => const Login(),
  '/home': (context) => const Home(),
  '/': (context) => const Home(),
  '/register': (context) => const Register(),
  '/user_profile': (context) => const UserProfile(),
  '/categories': (context) => const Categories(),
  '/post_article': (context) => const PostArticle(),
  '/category_detail': (context) => const CategoryDetail(),
  '/article_detail': (context) => const ArticleDetail(),
  '/common_list': (context) => const CommonList(),
};

final whitePaths = ['/login', '/register'];

class RouterGuard extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    // TODO: implement didPush
    super.didPush(route, previousRoute);
    final currentPath = previousRoute?.settings.name;
    LocalStorage.get('access_token').then((value) => {
          if (value == null)
            {
              if (!whitePaths.contains(currentPath))
                {Navigator.pushNamed(navigator!.context, '/login')}
            }
          else
            {
              print('${currentPath}redirect'),
              if (whitePaths.contains(currentPath))
                {Navigator.pushNamed(navigator!.context, '/')}
            }
        });
  }
}
