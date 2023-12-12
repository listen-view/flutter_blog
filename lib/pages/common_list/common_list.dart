import 'package:flutter/material.dart';
import 'package:material_app/widgets/article_list.dart';
import 'package:material_app/widgets/main_page_wrapper.dart';
import 'package:material_app/widgets/top_search_header.dart';

class CommonList extends StatefulWidget {
  const CommonList({Key? key}) : super(key: key);

  @override
  _CommonListState createState() => _CommonListState();
}

class _CommonListState extends State<CommonList> {
  String keyword = '';

  @override
  Widget build(BuildContext context) {
    return MainPageWrapper(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: TopSearchHeader(
              onChange: (data) => {
                setState(() {
                  keyword = data;
                })
              },
            ),
          ),
          Expanded(
              child: ArticleList(
            category: keyword,
          ))
        ],
      ),
    );
  }
}
