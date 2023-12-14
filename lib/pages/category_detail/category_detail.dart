import 'package:flutter/material.dart';
import 'package:material_app/widgets/article_list.dart';

class CategoryDetail extends StatefulWidget {
  final dynamic arguments;
  const CategoryDetail({Key? key, this.arguments}) : super(key: key);

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text('文章列表'),
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        body: ArticleList(
            category:
                widget.arguments != null ? widget.arguments['keyword'] : ''));
  }
}
