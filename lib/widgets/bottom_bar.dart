import 'package:flutter/material.dart';

class bottomBar extends StatefulWidget {
  const bottomBar({Key? key}) : super(key: key);

  @override
  bottomBarState createState() => bottomBarState();
}

class bottomBarState extends State<bottomBar> {
  var tabIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    barList.asMap().forEach((i, element) {
      if (element['path'] == ModalRoute.of(context)?.settings.name) {
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
    {'icon': Icons.settings, 'path': '/login', 'title': '设置'}
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
