import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_app/api/test.dart';

class ArticleList extends StatefulWidget {
  final String category;

  const ArticleList({Key? key, this.category = ''}) : super(key: key);

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  var articleList = [];

  @override
  void initState() {
    super.initState();
    _getArticleList();
  }

  @override
  void didUpdateWidget(covariant ArticleList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _getArticleList();
  }

  _getArticleList() {
    TestApi.getArticleList({'tag': widget.category}).then((value) {
      setState(() {
        articleList = [];
        articleList.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(widget.category == '' ? '全部' : widget.category,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: articleList.length,
                  itemBuilder: (context, index) {
                    final item = articleList[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/article_detail',
                            arguments: {'id': item['id']});
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(bottom: 20),
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              item['cover'],
                              width: 97,
                              height: 97,
                            )),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                (item['tag'].toList() as List)
                                    .map((e) => e['content'])
                                    .join(','),
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Text(
                                    item['title'],
                                    maxLines: 1,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ))
                          ],
                        ),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                'https://img1.baidu.com/it/u=1395340983,3906510524&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667',
                                height: 27,
                                width: 27,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                              child: Text(item['author']),
                            ),
                            Text(DateFormat('yyyy年MM月dd日 HH:mm')
                                .format(DateTime.parse(item['updateTime'])))
                          ],
                        ),
                      ),
                    );
                  })),
          SizedBox(
            height: 42,
            width: MediaQuery.of(context).size.width,
            child: OutlinedButton(
                onPressed: () {
                  print('more');
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 2, color: Color(0xff01B27D))),
                child: const Text(
                  'load more',
                  style: TextStyle(color: Color(0xff01B27D)),
                )),
          )
        ],
      ),
    );
  }
}
