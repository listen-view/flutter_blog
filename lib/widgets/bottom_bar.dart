import 'package:flutter/material.dart';


class bottomBar extends StatefulWidget {

  const bottomBar({Key? key}):super(key:key);

  @override
  bottomBarState createState()=>bottomBarState();
}

class bottomBarState extends State<bottomBar> {

  var tabIndex = 0;
  
  final barList = [
    {
      'icon':Icons.home,
      'title':'首页'
    },
    {
      'icon':Icons.category,
      'title':'分类'
    },
    {
      'icon':Icons.list,
      'title':'列表'
    },
    {
      'icon':Icons.settings,
      'title':'设置'
    }
  ];

  void _handleBarClick(int i){
    setState(() {
      tabIndex = i;
    });
  }

  @override
  Widget build(context) {
    return BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: _handleBarClick,
        showUnselectedLabels: true,
        selectedItemColor: Color(0xff01B27D),
        unselectedItemColor: Color(0xffC2C7D3),
        unselectedLabelStyle: TextStyle(color: Color(0xffC2C7D3)),
        items: List.generate(barList.length,(index){
      return BottomNavigationBarItem(
          icon: Icon(
            barList[index]['icon'] as IconData,
          ),
        label: barList[index]['title'] as String
      );
    }));
  }
}