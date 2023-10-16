import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> {
  var tabIndex = 0;
  var tagIndex = 0;
  final _keywordController = TextEditingController();

  final tabList = [
    {'label': '主页', 'icon': Icons.home},
    {'label': '类别', 'icon': Icons.category},
    {'label': '设置', 'icon': Icons.settings}
  ];

  final hotArticleList = [
    {
      'url':
          'https://p1-q.mafengwo.net/s13/M00/19/88/wKgEaVyGDw6AEZgUABWlpfCuucI72.jpeg?imageMogr2%2Fthumbnail%2F%21690x450r%2Fgravity%2FCenter%2Fcrop%2F%21690x450%2Fquality%2F90%7Cwatermark%2F1%2Fimage%2FaHR0cDovL21mdy1mYXN0ZGZzLTEyNTgyOTUzNjUuY29zLmFwLWJlaWppbmcubXlxY2xvdWQuY29tL3MxMS9NMDAvNDQvOUIvd0tnQkVGc1A1UnlBRHY3cEFBQUhaWlVQUmxROTkwLnBuZw%3D%3D%2Fgravity%2FSouthEast%2Fdx%2F10%2Fdy%2F11',
    },
    {
      'url':
          'https://p1-q.mafengwo.net/s12/M00/E9/B7/wKgED1wMyFKACwElAA4Hn3YpZC894.jpeg?imageMogr2%2Fthumbnail%2F%21690x450r%2Fgravity%2FCenter%2Fcrop%2F%21690x450%2Fquality%2F90%7Cwatermark%2F1%2Fimage%2FaHR0cDovL21mdy1mYXN0ZGZzLTEyNTgyOTUzNjUuY29zLmFwLWJlaWppbmcubXlxY2xvdWQuY29tL3MxMS9NMDAvNDQvOUIvd0tnQkVGc1A1UnlBRHY3cEFBQUhaWlVQUmxROTkwLnBuZw%3D%3D%2Fgravity%2FSouthEast%2Fdx%2F10%2Fdy%2F11'
    },
    {
      'url':
          'https://p1-q.mafengwo.net/s11/M00/AB/7C/wKgBEFtEe0-AIa8TAA03Ca87tYQ73.jpeg?imageMogr2%2Fthumbnail%2F%21690x450r%2Fgravity%2FCenter%2Fcrop%2F%21690x450%2Fquality%2F90%7Cwatermark%2F1%2Fimage%2FaHR0cDovL21mdy1mYXN0ZGZzLTEyNTgyOTUzNjUuY29zLmFwLWJlaWppbmcubXlxY2xvdWQuY29tL3MxMS9NMDAvNDQvOUIvd0tnQkVGc1A1UnlBRHY3cEFBQUhaWlVQUmxROTkwLnBuZw%3D%3D%2Fgravity%2FSouthEast%2Fdx%2F10%2Fdy%2F11'
    },
  ];

  final categories = [
    'all',
    'travel',
    'animals',
    'all',
    'travel',
    'animals',
    'all',
    'travel',
    'animals',
    'all',
    'travel',
    'animals',
  ];

  @override
  void dispose() {
    _keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff01B27D),
        currentIndex: tabIndex,
        onTap: (value) {
          setState(() {
            tabIndex = value;
          });
        },
        items: tabList.map((e) {
          return BottomNavigationBarItem(
              icon: Icon(e['icon'] as IconData), label: e['label'] as String);
        }).toList(),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/logo.png'),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(242, 245, 250, 1),
                          borderRadius: BorderRadius.circular(24)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Color.fromRGBO(65, 79, 96, 0.3),
                          ),
                          Expanded(
                              flex: 1,
                              child: TextField(
                                controller: _keywordController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none, hintText: '搜索'),
                              ))
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 60,
            child: const Text(
              '最新消息',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
              height: 48,
              child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              tagIndex = index;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                categories[index],
                                style: TextStyle(
                                    fontSize: 14,
                                    color: tagIndex == index
                                        ? Colors.black
                                        : const Color(0xFF949AA9)),
                              ),
                              if (tagIndex == index)
                                const Icon(
                                  Icons.circle_rounded,
                                  color: Color(0xff01B27D),
                                  size: 6,
                                ),
                            ],
                          )),
                    );
                  })),
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: 320,
            child: Swiper(
              autoplay: true,
              itemCount: hotArticleList.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child:
                          Image.network(hotArticleList[index]['url'] as String),
                    ),
                    Positioned(
                        child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    width: 80,
                                    height: 32,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromRGBO(250, 250, 250, 0.2)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.heart_broken,
                                            color: Colors.red,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              '${Random().nextInt(100)}1',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ]),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '这是标题一',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                '这是描述',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 12),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                          'https://img0.baidu.com/it/u=1234650561,1036619751&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1697302800&t=4dce22dac28d9621b9470a271bd6106e'),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '路飞',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '12分钟之前',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    ),
                                                    Text(
                                                      '2022-01-01',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    )
                                                  ],
                                                )
                                              ]),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                );
              },
              pagination:
                  const SwiperPagination(margin: EdgeInsets.only(top: 30)),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 50, 0, 20),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: const Text(
                    '类别',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                    decoration: const BoxDecoration(color: Color(0xff01B27D)),
                    child: const Text(
                      '查看全部',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Container(
                width: 180,
                height: 180,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://t7.baidu.com/it/u=1819248061,230866778&fm=193&f=GIF'))),
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: const Column(children: [
                  Text(
                    '旅游',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '共26条',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ]),
              );
            },
          ),
        ]),
      ),
    );
  }
}
