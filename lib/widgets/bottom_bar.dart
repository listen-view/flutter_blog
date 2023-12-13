import 'package:flutter/material.dart';
import 'package:material_app/provider/route_store.dart';
import 'package:provider/provider.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<CustomBottomBar> {
  var tabIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    barList.asMap().forEach((i, element) {
      var routeStore = Provider.of<RouteStore>(context);
      if (element['path'] == routeStore.currentRoute) {
        setState(() {
          tabIndex = i;
        });
      }
    });
  }

  final barList = [
    {'icon': Icons.home, 'path': '/home', 'title': '首页'},
    {'icon': Icons.category, 'path': '/categories', 'title': '分类'},
    {'icon': Icons.list, 'path': '/common_list', 'title': '列表'},
    {'icon': Icons.settings, 'path': '/user_profile', 'title': '设置'}
  ];

  void _handleBarClick(int i) {
    setState(() {
      tabIndex = i;
      Navigator.pushReplacementNamed(context, barList[i]['path'] as String);
    });
  }

  @override
  Widget build(context) {
    return BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: _handleBarClick,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff01B27D),
        unselectedItemColor: const Color(0xffC2C7D3),
        unselectedLabelStyle: const TextStyle(color: Color(0xffC2C7D3)),
        items: List.generate(barList.length, (index) {
          return BottomNavigationBarItem(
              icon: Icon(
                barList[index]['icon'] as IconData,
              ),
              label: barList[index]['title'] as String);
        }));
  }
}
