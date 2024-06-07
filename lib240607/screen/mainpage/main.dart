import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../widget/navigationbar.dart';
// import 'package:flutter_application_1/secondDetail.dart';
// import 'package:flutter_application_1/subDetail.dart';
// import 'package:flutter_application_1/thirdDetail.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  static const String _title = 'Widget Example';
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainWidget(),
      title: _title,
      initialRoute: '/',
      // routes: {
      //   '/' : (context) => Subdetail(),
      //   '/second' : (context) => Seconddetail(),
      //   '/third' : (context) => Thirddetail()
      // },
    );
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _HttpAppState();
}

class _HttpAppState extends State<MainWidget> {
  List? data;
  final Map<String, int> monthMap = {
    'January': 1,
    'February': 2,
    'March': 3,
    'April': 4,
    'May': 5,
    'June': 6,
    'July': 7,
    'August': 8,
    'September': 9,
    'October': 10,
    'November': 11,
    'December': 12,
  };
  final Map<String, String> species = {
    'Alligator': '악어',
    'Anteater': '개미핥기',
    'Bear': '곰',
    'Bear cub': '곰 새끼',
    'Bird': '새',
    'Bull': '황소',
    'Cat': '고양이',
    'Cub': '새끼',
    'Chicken': '닭',
    'Cow': '소',
    'Deer': '사슴',
    'Dog': '개',
    'Duck': '오리',
    'Eagle': '독수리',
    'Elephant': '코끼리',
    'Frog': '개구리',
    'Goat': '염소',
    'Gorilla': '고릴라',
    'Hamster': '햄스터',
    'Hippo': '하마',
    'Horse': '말',
    'Koala': '코알라',
    'Kangaroo': '캥거루',
    'Lion': '사자',
    'Monkey': '원숭이',
    'Mouse': '쥐',
    'Octopus': '문어',
    'Ostrich': '타조',
    'Penguin': '펭귄',
    'Pig': '돼지',
    'Rabbit': '토끼',
    'Rhino': '코뿔소',
    'Rhinoceros': '코뿔소',
    'Sheep': '양',
    'Squirrel': '다람쥐',
    'Tiger': '호랑이',
    'Wolf': '늑대',
  };

  // ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _scrollController.addListener(_scrollListener);
    data = new List.empty(growable: true);
    getJSONData();
  }
  //
  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }
  //
  // void _scrollListener() {
  //   double position = _scrollController.position.pixels;
  //   double cardWidth = 320; // 카드의 너비
  //
  //   int visibleCardIndex = (position / cardWidth).floor();
  //   double remainder = position % cardWidth;
  //   double threshold = cardWidth / 2;
  //
  //   if (remainder > threshold && remainder < 2 * threshold) {
  //     // 오른쪽에 가까운 카드가 보이는 경우
  //     _scrollController.animateTo(
  //       (visibleCardIndex + 1) * cardWidth, // 다음 카드의 위치로 스크롤
  //       duration: Duration(milliseconds: 1000),
  //       curve: Curves.easeInOut,
  //     );
  //   }
  //   else {
  //     // 왼쪽에 가까운 카드가 보이는 경우 또는 현재 카드의 중간 부분이 보이는 경우
  //     _scrollController.animateTo(
  //       visibleCardIndex * cardWidth, // 현재 카드의 위치로 스크롤
  //       duration: Duration(milliseconds: 3000),
  //       curve: Curves.easeInOut,
  //     );
  //   }
  // }

  Color hexToColorBack(String hex) {
    if (hex == "" || hex == "FFFFFF") {
      hex = "FBFCD5";
    }
    // 16진수 문자열을 정수로 변환하고, Color 객체를 생성합니다.
    return Color(int.parse(hex, radix: 16) + 0xFF000000);
  }

  Color hexToColorFont(String hex) {
    if (hex == "") {
      hex = "000000";
    }
    // 16진수 문자열을 정수로 변환하고, Color 객체를 생성합니다.
    return Color(int.parse(hex, radix: 16) + 0xFF000000);
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: bottomNavigator(context, currentPage),
      body: Container(
        height: 680,
        color: Color(0xFFFBFCD5),
        child: Stack(children: [
          Column(children: [
            Container(
              height: 140,
              padding: EdgeInsets.only(top: 40),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset('assets/images/blue_ribbon6 1.png'),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 4),
                    height: 42,
                    width: 186,
                    child: Text(
                      "Today's Birth",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Monggle',
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 530,
              child: Center(
                child: data!.length == 0
                    ? Column(children: [
                        Image.asset('assets/images/침착맨탕후루 1.png'),
                        Text(
                          '생일자가 없으니 탕탕 후루후루',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ])
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        // controller: _scrollController,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.only(left: 45),
                            color: Colors.transparent,
                            elevation: 0,
                            child: Stack(
                              children: [
                                Image.asset('assets/images/생일캐릭1 프레임.png'),
                                Container(
                                  alignment: Alignment.center,
                                  height: 480,
                                  width: 320,
                                  margin: const EdgeInsets.only(top: 22),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: hexToColorBack(
                                              data![index]['title_color']),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        width: 150,
                                        height: 24,
                                        alignment: Alignment.center,
                                        margin:
                                            const EdgeInsets.only(bottom: 17),
                                        child: Text(
                                          data![index]['name'],
                                          style: TextStyle(
                                            color: hexToColorFont(
                                                data![index]['text_color']),
                                            fontFamily: 'beomseok',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Image.network(
                                          data![index]['image_url'],
                                          height: 160,
                                          width: 90,
                                          fit: BoxFit.contain,
                                        ),
                                        margin:
                                            const EdgeInsets.only(bottom: 12),
                                      ),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: hexToColorBack(
                                                        data![index]
                                                            ['title_color']),
                                                  ),
                                                  width: 80,
                                                  height: 24,
                                                  alignment: Alignment.center,
                                                  margin: const EdgeInsets.only(
                                                      bottom: 4),
                                                  child: Text(
                                                    '종',
                                                    style: TextStyle(
                                                      fontFamily: 'beomseok',
                                                      fontSize: 18,
                                                      color: hexToColorFont(
                                                          data![index]
                                                              ['text_color']),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: hexToColorBack(
                                                        data![index]
                                                            ['title_color']),
                                                  ),
                                                  width: 80,
                                                  height: 24,
                                                  alignment: Alignment.center,
                                                  margin: const EdgeInsets.only(
                                                      bottom: 4),
                                                  child: Text(
                                                    '성별',
                                                    style: TextStyle(
                                                      fontFamily: 'beomseok',
                                                      fontSize: 18,
                                                      color: hexToColorFont(
                                                          data![index]
                                                              ['text_color']),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: hexToColorBack(
                                                        data![index]
                                                            ['title_color']),
                                                  ),
                                                  width: 80,
                                                  height: 24,
                                                  alignment: Alignment.center,
                                                  margin: const EdgeInsets.only(
                                                      bottom: 4),
                                                  child: Text(
                                                    '생일',
                                                    style: TextStyle(
                                                      fontFamily: 'beomseok',
                                                      fontSize: 18,
                                                      color: hexToColorFont(
                                                          data![index]
                                                              ['text_color']),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: hexToColorBack(
                                                        data![index]
                                                            ['title_color']),
                                                  ),
                                                  width: 130,
                                                  height: 24,
                                                  alignment: Alignment.center,
                                                  margin: const EdgeInsets.only(
                                                      bottom: 4),
                                                  child: Text(
                                                    species[data![index]
                                                            ['species']] ??
                                                        data![index]['species'],
                                                    style: TextStyle(
                                                      fontFamily: 'beomseok',
                                                      fontSize: 16,
                                                      color: hexToColorFont(
                                                          data![index]
                                                              ['text_color']),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      color: hexToColorBack(
                                                          data![index]
                                                              ['title_color']),
                                                    ),
                                                    width: 130,
                                                    height: 24,
                                                    alignment: Alignment.center,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 4),
                                                    child: ColorFiltered(
                                                      colorFilter: ColorFilter.mode(
                                                          hexToColorFont(data![
                                                                  index]
                                                              ['text_color']),
                                                          BlendMode.srcIn),
                                                      child: data![index]
                                                                  ['gender'] ==
                                                              'Male'
                                                          ? Image.asset(
                                                              'assets/images/Male.png')
                                                          : Image.asset(
                                                              'assets/images/Female.png'),
                                                    )),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: hexToColorBack(
                                                        data![index]
                                                            ['title_color']),
                                                  ),
                                                  width: 130,
                                                  height: 24,
                                                  alignment: Alignment.center,
                                                  margin: const EdgeInsets.only(
                                                      bottom: 4),
                                                  child: Text(
                                                    "${monthMap[data![index]['birthday_month']] ?? ''}월 " +
                                                        data![index]
                                                            ['birthday_day'] +
                                                        '일',
                                                    style: TextStyle(
                                                      fontFamily: 'beomseok',
                                                      fontSize: 15,
                                                      color: hexToColorFont(
                                                          data![index]
                                                              ['text_color']),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        margin:
                                            const EdgeInsets.only(bottom: 4),
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: hexToColorBack(
                                                data![index]['title_color']),
                                          ),
                                          width: 220,
                                          height: 60,
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Text(
                                                  '좋아하는 말',
                                                  style: TextStyle(
                                                    fontFamily: 'beomseok',
                                                    fontSize: 16,
                                                    color: hexToColorFont(
                                                        data![index]
                                                            ['text_color']),
                                                  ),
                                                ),
                                                margin: const EdgeInsets.only(
                                                    top: 2),
                                              ),
                                              Flexible(
                                                  child: Container(
                                                child: Text(
                                                  data![index]['quote'] == ""
                                                      ? '-'
                                                      : data![index]['quote'],
                                                  style: TextStyle(
                                                      fontFamily: 'beomseok',
                                                      color: hexToColorFont(
                                                          data![index]
                                                              ['text_color']),
                                                      fontSize: data![index]
                                                                      ['quote']
                                                                  .length >
                                                              70
                                                          ? 10
                                                          : 12),
                                                  softWrap: true,
                                                  overflow:
                                                      TextOverflow.visible,
                                                ),
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 10),
                                              ))
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: data!.length,
                        padding: const EdgeInsets.only(right: 45),
                      ),
              ),
            )
          ]),
          Container(
            child: Image.asset("assets/images/폭죽.png"),
            height: 180,
            width: 400,
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(top: 20),
          ),
        ]),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = 'https://api.nookipedia.com/villagers';
    var response = await http.get(Uri.parse(url), headers: {
      "x-api-key": "1e12770e-930f-4f94-8bf2-7dd37587e30b",
      "Accept-Version": "1.0.0",
    });

    // print(response.body);
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON;
      int currentMonth = DateTime.now().month;
      int currentDay = DateTime.now().day;
      for (var villager in result) {
        if (monthMap[villager['birthday_month']] == currentMonth) {
          if (int.parse(villager['birthday_day']) == currentDay) {
            data?.add(villager);
            print(villager);
            print(data);
          }
        }
      }
    });
    return response.body;
  }
}
