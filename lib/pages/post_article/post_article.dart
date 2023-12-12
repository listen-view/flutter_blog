import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:material_app/api/test.dart';

class PostArticle extends StatefulWidget {
  const PostArticle({Key? key}) : super(key: key);

  @override
  _PostArticleState createState() => _PostArticleState();
}

class _PostArticleState extends State<PostArticle> {
  final _formKey = GlobalKey<FormState>();
  final _formData = {'title': '', 'content': [], 'tags': '', 'cover': ''};
  final quill.QuillController _controller = quill.QuillController.basic();

  Widget _generateInput(String hintText) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(230, 235, 246, 0.5),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: TextFormField(
        onChanged: (value) {
          _formData[hintText] = value;
        },
        decoration:
            InputDecoration(border: InputBorder.none, hintText: hintText),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$hintText is null';
          }
          return null;
        },
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formData['content'] =
          jsonEncode(_controller.document.toDelta().toJson());
      TestApi.postArticle(_formData).then((value) {
        Navigator.pop(context);
      });
    }
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
        title: const Text('发布文章'),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Form(
                key: _formKey,
                child: ListView(children: [
                  _generateInput('title'),
                  _generateInput('cover'),
                  _generateInput('tags'),
                  quill.QuillToolbar.basic(controller: _controller),
                  SizedBox(
                    height: 500,
                    child: quill.QuillEditor.basic(
                        controller: _controller, readOnly: false),
                  )
                ]),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: 45,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(22)),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: _submit,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff01B27D))),
                  child: const Text('确定')),
            )
          ],
        )),
      ),
    );
  }
}
