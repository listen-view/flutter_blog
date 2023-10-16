import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key, this.rowCount = 2}) : super(key: key);
  final int rowCount;

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  void _goClassList() {
    Navigator.pushNamed(context, '/category_detail');
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10,
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
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://img2.baidu.com/it/u=4155793158,2331455287&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500'))),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '旅游',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text('92条',
                        style: TextStyle(color: Colors.white, fontSize: 14))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
