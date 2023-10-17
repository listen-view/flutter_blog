import 'package:flutter/material.dart';
import 'package:material_app/widgets/main_page_wrapper.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return const MainPageWrapper(child: Text(''));
  }
}
