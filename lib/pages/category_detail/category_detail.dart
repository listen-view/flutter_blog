import 'package:flutter/material.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({Key? key}) : super(key: key);

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
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text('travel',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.only(bottom: 20),
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://img2.baidu.com/it/u=4155793158,2331455287&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500',
                              width: 97,
                              height: 97,
                            )),
                        title: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('travel',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                            Text(
                              '安装和环境配置',
                              style: TextStyle(fontSize: 14),
                            ),
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
                            const Text('tom'),
                            const Text('7 minutes before')
                          ],
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
                      side:
                          const BorderSide(width: 2, color: Color(0xff01B27D))),
                  child: const Text(
                    'load more',
                    style: TextStyle(color: Color(0xff01B27D)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
