import 'package:flutter/material.dart';
import 'package:material_app/widgets/bottom_bar.dart';

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
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('类别',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            Expanded(
                flex: 1,
                child: GridView.builder(
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14))
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
      bottomNavigationBar: const bottomBar(),
    );
  }
}
