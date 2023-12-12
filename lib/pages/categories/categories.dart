import 'package:flutter/material.dart';
import 'package:material_app/widgets/category_list.dart';
import 'package:material_app/widgets/main_page_wrapper.dart';
import 'package:material_app/widgets/top_search_header.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  void _goClassList() {
    Navigator.pushNamed(context, '/category_detail');
  }

  @override
  Widget build(context) {
    return MainPageWrapper(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopSearchHeader(
              onChange: (data) => {},
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 60,
              child: const Text(
                '类别',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const Expanded(flex: 1, child: CategoryList())
          ],
        ),
      ),
    );
  }
}
