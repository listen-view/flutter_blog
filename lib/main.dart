import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_app/router.dart';
import 'package:material_app/utils/storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        // routes: routeList,
        title: 'Flutter Demo',
        navigatorObservers: [RouterGuard()],
        routes: routeList,
      ),
    );
  }
}
