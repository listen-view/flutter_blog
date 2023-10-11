import 'package:flutter/material.dart';
import 'package:material_app/pages/Home/Home.dart';
import 'package:material_app/pages/Login/Login.dart';
import 'pages/Register/Register.dart';
import 'pages/tags/Tags.dart';

final routeList = {
  '/tags': (context) => const Tags(),
  '/login': (context) => const Login(),
  '/home': (context) => const Home(),
  '/': (context) => const Register(),
};

class RouterGuard extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    // TODO: implement didPush
    super.didPush(route, previousRoute);
  }
}
