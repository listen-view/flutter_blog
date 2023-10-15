import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [RouterGuard()],
      onGenerateRoute: (RouteSettings settings) {
        final loginAndRegister = ['/login', '/register'];

        return MaterialPageRoute(builder: (context) {
          return FutureBuilder(
              future: LocalStorage.get('access_token'),
              builder: (context, snapshot) {
                String? routeName = settings.name;
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data != null) {
                    if (loginAndRegister.contains(settings.name)) {
                      routeName = '/';
                    }
                  } else if (!loginAndRegister.contains(settings.name)) {
                    routeName = '/register';
                  }
                }
                return routeList[routeName]!(context);
              });
        });
      },
    );
  }
}
