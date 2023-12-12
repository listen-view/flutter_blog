import 'package:flutter/material.dart';
import 'package:material_app/api/test.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key, this.rowCount = 2}) : super(key: key);
  final int rowCount;

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  var _categories = [];

  void _goClassList() {
    Navigator.pushNamed(context, '/category_detail');
  }

  @override
  void initState() {
    super.initState();
    TestApi.getCategories({}).then((res) {
      _categories = res['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: _categories.length,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.rowCount,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: _goClassList,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(_categories[i]['cover']))),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _categories[i]['content'],
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const Text('92条',
                        style: TextStyle(color: Colors.white, fontSize: 14))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
