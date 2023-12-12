import 'package:flutter/material.dart';
import 'package:material_app/widgets/bottom_bar.dart';

class MainPageWrapper extends StatefulWidget {
  final Widget child;
  final bool hasBottom = true;
  const MainPageWrapper({Key? key, bool? hasBottom, required this.child})
      : super(key: key);

  @override
  _MainPageWrapperState createState() => _MainPageWrapperState();
}

class _MainPageWrapperState extends State<MainPageWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: widget.hasBottom ? const bottomBar() : null,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/post_article');
        },
        backgroundColor: const Color(0xff01B27D),
        child: const Icon(Icons.add),
      ),
    );
  }
}
