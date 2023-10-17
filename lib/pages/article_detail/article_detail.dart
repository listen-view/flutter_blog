import 'package:flutter/material.dart';

class ArticleDetail extends StatefulWidget {
  const ArticleDetail({Key? key}) : super(key: key);

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  var articleBody = '''
  据知名媒体人滨岩透露，巴塞罗那球队的超级巨星梅西本月将获得他个人职业生涯的第8座金球奖随后他将在下个月造访中国成都并参加足球比赛。这无疑给中国的梅西球迷带来了双重喜悦，他们既能见证这位足球界的球王加冕金球奖的时刻，又可以在中国看到梅西的身影。滨岩表示，梅西将会穿着粉色球衣，在10月30日与法国巴黎队比赛完后横跨到中国，和成都蓉城进行一场足球盛宴。
''';

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
        title: const Text('文章详情'),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://img0.baidu.com/it/u=3684566156,2414568464&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800',
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  '恭喜梅西！恭喜中国球迷！曝梅西加冕第8座金球奖，下月来华踢球',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              RichText(text: TextSpan(text: articleBody))
            ]),
          )
        ]),
      ),
    );
  }
}
