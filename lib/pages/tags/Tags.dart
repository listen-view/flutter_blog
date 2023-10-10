import 'package:flutter/material.dart';

class Tags extends StatefulWidget {
  const Tags({Key? key}) : super(key: key);

  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  List<String> tagList = [
    'lifeStyle',
    'travel',
    'sport',
    'thchnology',
    'study',
    'skill',
    'news'
  ];

  void _saveTags() {}
  @override
  Widget build(BuildContext context) {
    const TextStyle titleStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24);
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.fromLTRB(35, 120, 35, 100),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xee01B27D)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '保存您的兴趣',
                style: titleStyle,
              ),
              const Text(
                '以获得更好的内容和体验',
                style: titleStyle,
              ),
              Expanded(
                flex: 1,
                child: Container(
                    margin: const EdgeInsets.only(top: 85),
                    child: Wrap(
                      children: tagList.map((item) {
                        return Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 12, 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border:
                                Border.all(color: Colors.white, width: 1)),
                            padding: const EdgeInsets.fromLTRB(16, 10, 18, 10),
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white
                              ),
                            ));
                      }).toList(),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: _saveTags,
                    child: const Text(
                      '保存兴趣',
                      style: TextStyle(color: Colors.black),
                    )),
              )
            ],
          )),
    );
  }
}
