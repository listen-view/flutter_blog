import 'package:flutter/material.dart';

class RouteStore with ChangeNotifier {
  String _currentRoute = '/';

  String get currentRoute => _currentRoute;

  void setRouteInfo(String routeName) {
    _currentRoute = routeName;
  }
}
