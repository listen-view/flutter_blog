import 'package:flutter/material.dart';
import 'package:material_app/api/test.dart';
import 'package:material_app/model/tag.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key, this.keyword = '', this.rowCount = 2})
      : super(key: key);
  final int rowCount;
  final String keyword;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<TagModel> _categories = [];

  void _goClassList(String content) {
    Navigator.pushNamed(context, '/category_detail',
        arguments: {'keyword': content});
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  _getCategories() {
    TestApi.getCategories({'keyword': widget.keyword}).then((res) {
      setState(() {
        _categories = [];
        _categories.addAll(res);
      });
    });
  }

  @override
  void didUpdateWidget(covariant CategoryList old) {
    super.didUpdateWidget(old);
    _getCategories();
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
            onTap: () => _goClassList(_categories[i].content),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(_categories[i].cover))),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _categories[i].content,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text("${_categories[i].postCount}条",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
