import 'package:flutter/material.dart';
import 'package:material_app/pages/Home/Home.dart';
import 'package:material_app/pages/Login/Login.dart';
import 'package:material_app/pages/common_list/common_list.dart';
import 'package:material_app/pages/categories/categories.dart';
import 'pages/Register/Register.dart';
import 'pages/tags/Tags.dart';
import 'pages/category_detail/category_detail.dart';

final routeList = {
  '/tags': (context) => const Tags(),
  '/login': (context) => const Login(),
  '/home': (context) => const Home(),
  '/': (context) => const Home(),
  '/register': (context) => const Register(),
  '/categories': (context) => const Categories(),
  '/category_detail': (context) => const CategoryDetail(),
  '/common_list': (context) => const CommonList()
};

class RouterGuard extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    // TODO: implement didPush
    super.didPush(route, previousRoute);
  }
}
