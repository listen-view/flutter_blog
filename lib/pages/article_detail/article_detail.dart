import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material_app/api/test.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class ArticleDetail extends StatefulWidget {
  const ArticleDetail({Key? key}) : super(key: key);

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  var articleMsg = {};
  final quill.QuillController _controller = quill.QuillController.basic();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dynamic route = ModalRoute.of(context)?.settings.arguments;
    if (route['id'] is int) _getArticleDetail(route['id']);
  }

  _getArticleDetail(int id) {
    TestApi.getArticleDetail({'id': id}).then((value) {
      setState(() {
        articleMsg = value['data'];
        _controller.document =
            quill.Document.fromJson(jsonDecode(articleMsg['content']));
      });
    });
  }

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
        title: Text(articleMsg['title'] ?? ''),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
      ),
      body: articleMsg.isNotEmpty
          ? SingleChildScrollView(
              child: Column(children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(articleMsg['cover']))),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        articleMsg['author'],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    quill.QuillEditor.basic(
                      controller: _controller,
                      readOnly: true,
                    )
                  ]),
                )
              ]),
            )
          : null,
    );
  }
}
