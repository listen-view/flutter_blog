import 'package:flutter/material.dart';
import 'package:material_app/widgets/bottom_bar.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  void _goClassList() {
    Navigator.of(context).pushNamed('/category_list');
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
                                        'https://i2.hdslb.com/bfs/archive/c7c503d7aa81205474503b0a3e79b312bb1406ff.jpg@440w_276h_1c_!web-space-index-topvideo.webp'))),
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
