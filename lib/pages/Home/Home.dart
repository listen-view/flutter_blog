import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:material_app/api/test.dart';
import 'package:material_app/model/article_detail.dart';
import 'package:material_app/model/tag.dart';
import 'package:material_app/widgets/category_list.dart';
import 'package:material_app/widgets/main_page_wrapper.dart';
import 'package:material_app/widgets/top_search_header.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tagIndex = 0;

  List<ArticleModel> hotArticleList = [];

  List<TagModel> categories = [];

  @override
  void initState() {
    super.initState();
    _queryCategories();
  }

  _queryCategories() {
    TestApi.getCategories({}).then((value) {
      setState(() {
        categories = value;
      });
      _getHotArticleByTag();
    });
  }

  void _getHotArticleByTag() {
    TestApi.getHotArticle({'tag': categories[tagIndex].content}).then((value) {
      setState(() {
        hotArticleList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainPageWrapper(
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: ListView(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                TopSearchHeader(
                  onChange: (data) => {},
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
                                  _getHotArticleByTag();
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      categories[index].content,
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
                            child: Image.network(hotArticleList[index].cover),
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
                                        filter: ImageFilter.blur(
                                            sigmaX: 5, sigmaY: 5),
                                        child: Container(
                                          width: 80,
                                          height: 32,
                                          decoration: const BoxDecoration(
                                              color: Color.fromRGBO(
                                                  250, 250, 250, 0.2)),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.heart_broken,
                                                  color: Colors.red,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10),
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
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                child: const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '路飞',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            '12分钟之前',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12),
                                                          ),
                                                          Text(
                                                            '2022-01-01',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
                    pagination: const SwiperPagination(
                        margin: EdgeInsets.only(top: 30)),
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: const Text(
                          '类别',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                          decoration:
                              const BoxDecoration(color: Color(0xff01B27D)),
                          child: const Text(
                            '查看全部',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
              const CategoryList(
                rowCount: 3,
              )
            ],
          )),
    );
  }
}
