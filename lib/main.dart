import 'package:flutter/material.dart';
import 'package:material_app/pages/Login/Login.dart';
import 'pages/Register/Register.dart';
import 'pages/tags/Tags.dart';

void main() {
  runApp(const MyApp());
}
final routeList = {
  '/tags': (context) => const Tags(),
  '/sign_up': (context)=> const Register(),
  '/': (context) => const Login(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (RouteSettings settings){
        final pageBuilder = routeList[settings.name];
        return MaterialPageRoute(builder: (context){
          return pageBuilder!(context);
        });
      },
    );
  }
}
